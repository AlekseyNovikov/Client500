//
//  TSNetworkManager.h
//  TwittySearch
//
//  Created by Aleksey Novikov on 06/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//


@class CLPhotoCategory;


@interface TSNetworkManager : NSObject

+ (TSNetworkManager *)sharedManager;

@property (nonatomic, strong) NSURL *baseURL;
@property (nonatomic, strong, readonly) NSURLSession *session;

/*!
 * @discussion Creates an HTTP GET request for the specified URL, then calls a handler upon completion.
 * @param urlString The http or https URL to be retrieved.
 * @param completionBlock A block object to be executed when the task finishes successfully. It's executed on background thread.
 * @param errorBlock A block object to be executed when the task finishes unsuccessfully. It's executed on background thread.
 */
- (void) performRequestToServer:(NSString *)urlString
                      onSuccess:(void(^)(id json))completionBlock
                      onFailure:(void(^)(NSError *error))errorBlock;

@end

@interface TSNetworkManager (Photos)

/*!
 *  @discussion Get photos by category name
 *
 *  @param category index
 *  @param page number
 *  @param completion block object to be executed when the task finishes. It's executed on main thread
 */
- (void)photosFromCategory:(CLPhotoCategory *)category
                      page:(NSUInteger)page
                completion:(void(^)(NSArray *photos, NSUInteger pageCount, NSError *error))completion;
@end


