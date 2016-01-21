//
//  TSNetworkManager.m
//  TwittySearch
//
//  Created by Aleksey Novikov on 06/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import "TSNetworkManager.h"
#import "CLAPIHelper.h"

///Categories
#import "NSDictionary+JSON.h"

/// Constants
NSString * const ErrorDomain = @"com.client500";
@interface TSNetworkManager ()

@property (nonatomic, strong) NSURLSessionConfiguration *sessionConfiguration;
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong, readwrite) NSURLSession *session;

@end


@implementation TSNetworkManager
{
	///parameter responsible for network activity indicator
	__block NSUInteger _networkRequestNumber;
}

#pragma mark - Initialization
+ (TSNetworkManager *)sharedManager
{
	static id _sharedManager = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSURL *baseUrl = nil;
		baseUrl = [NSURL URLWithString:urlAPIBaseURL];
		_sharedManager = [[TSNetworkManager alloc]initWithBaseURL:baseUrl];
	});

	return _sharedManager;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{

	if (self = [super init]) {
		_networkRequestNumber = 0;
		self.sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
		self.sessionConfiguration.timeoutIntervalForRequest = 30.0;
		self.sessionConfiguration.timeoutIntervalForResource = 60.0;
		self.sessionConfiguration.HTTPMaximumConnectionsPerHost = 1;
		self.operationQueue = [[NSOperationQueue alloc] init];
		self.operationQueue.maxConcurrentOperationCount = 1;
		self.session = [NSURLSession sessionWithConfiguration:self.sessionConfiguration
													 delegate:nil
												delegateQueue:self.operationQueue];
		self.baseURL = url;

	}
	return self;
}

#pragma mark - Requests

/*!
 * @discussion Creates an HTTP GET request for the specified URL, then calls a handler upon completion.
 * @param urlString The http or https URL to be retrieved.
 * @param completionBlock A block object to be executed when the task finishes successfully. It's executed on main thread.
 * @param errorBlock A block object to be executed when the task finishes unsuccessfully. It's executed on main thread.
 */
- (void) performRequestToServer:(NSString *)urlString
                      onSuccess:(void(^)(id json))completionBlock
                      onFailure:(void(^)(NSError *error))errorBlock{
    /// show network indicator
    [self hideNetworkActivity:NO];
    
    NSURL *url = [NSURL URLWithString:urlString relativeToURL:self.baseURL];
    
    __weak TSNetworkManager *weakSelf = self;
    NSURLSessionDataTask *dataTask =
    [self.session
     dataTaskWithURL:url
     completionHandler:^(NSData *data, NSURLResponse *response, NSError *connectionError) {
         TSNetworkManager *strongSelf = weakSelf;
         /// check if there is a server/connection error
         if (connectionError)
         {
             NSLog(@"error while perfoming request with url %@", urlString);
             if (errorBlock) {
                     errorBlock(connectionError);
             }
         }
         /// get the server response and parse it
         else{
             
             if (strongSelf) {
                 NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
                 id decodedResponse = [strongSelf responseFromServer:data
                                                        httpResponse:httpResponse
                                                          methodName:@"performRequestToServer"];
                 
                 if ([decodedResponse isKindOfClass:[NSError class]])
                 {
                     if (errorBlock) {
                             errorBlock(decodedResponse);
                     }
                 }
                 else if ([decodedResponse isKindOfClass:[NSDictionary class]] || [decodedResponse isKindOfClass:[NSArray class]] )
                 {
                     /// give outside the response
                     if (completionBlock) {
                             completionBlock(decodedResponse);
                     }
                 }
             }
             
         }
         
         /// stop the network activity indicator
         if (strongSelf)
         {
             [strongSelf hideNetworkActivity:YES];
         }
     }];
    [dataTask resume];
}

#pragma mark - Activity indicator
/*!
 * @discussion Show/hide the network  indicator
 * @param hidden If YES the indicator must be hidden
 */
- (void)hideNetworkActivity:(BOOL)hidden
{
	if (hidden) {
		_networkRequestNumber--;
		if (_networkRequestNumber <= 0) {
			_networkRequestNumber = 0;
			dispatch_async(dispatch_get_main_queue(), ^{
				[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
			});
		}
	} else {
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		_networkRequestNumber++;
	}
}

#pragma mark - Errors
/*!
 * @discussion Parse the response from server as a json returned file
 * @param data Data returned by the server
 * @param httpResponse the http response from server
 * @return the parsed answer
 */
- (id)responseFromServer:(NSData *)data
			httpResponse:(NSHTTPURLResponse*)httpResponse
			  methodName:(NSString *)methodName
{
	NSError *jsonError = nil;
	NSDictionary *json = nil;
	/// if there is data return it as json
	if (data) {
		json = [NSJSONSerialization JSONObjectWithData:data
											   options:NSJSONReadingMutableContainers
												 error:&jsonError];
	}
	/// error while converting response to json
	if (jsonError) {
		NSLog(@"error while trying to convert response from server to json in %@ request", methodName);
		return jsonError;
	}
	/// error from server with a description of the error
	else if ([httpResponse statusCode] > 400) {
		NSLog(@"error from server(%@ request)", methodName);
		NSString *description = nil;
		if (json[@"error"]) {
			description = json[@"error"];
		} else {
			description = [NSHTTPURLResponse
						   localizedStringForStatusCode:[httpResponse statusCode]];
		}
		NSError *serverError = [self errorWithCode:[httpResponse statusCode]
									   description:description];
		return serverError;
	}
	/// success
	return json;
}

/*!
 * @discussion Build a NSError object (it's particulary
 * useful when the error is only present it the response header)
 * @param StatusCode the code of the error
 * @return Description the description of the error
 */
- (NSError *)errorWithCode:(NSUInteger)statusCode
			   description:(NSString *)description
{
	NSError *error =  [NSError errorWithDomain:ErrorDomain
										  code:statusCode
									  userInfo:@
					   {
						   NSLocalizedDescriptionKey        : description,
					   }];

	return error;

}

@end
