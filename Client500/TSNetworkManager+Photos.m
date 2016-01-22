//
//  TSNetworkManager+Photos.m
//  Client500
//
//  Created by Aleksey Novikov on 21/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import "TSNetworkManager.h"
#import "CLPhotoCategory.h"
#import "CLPhoto.h"

@implementation TSNetworkManager (Photos)
//https://api.500px.com/v1/photos?only=Nude&page=5&image_size=2,4&consumer_key=KvOmAIiUyOlihwz4JkUdAjB2zXzKnvek5169dPmV

- (void)photosFromCategory:(CLPhotoCategory *)category
					  page:(NSUInteger)page
				completion:(void (^)(NSArray *photos, NSUInteger pageCount, NSError *error))completion
{
	NSString *categoryName = category.categoryName;
	NSString *urlQueryString = [NSString stringWithFormat:@"%@?consumer_key=%@&image_size=2,4&only=%@&page=%lu", photos, consumerKey, [categoryName stringByReplacingOccurrencesOfString:@" " withString:@"+"], (unsigned long)page];
	[self performRequestToServer:urlQueryString
					   onSuccess:^(id json) {
		 NSMutableArray *categoryPhotos = [NSMutableArray array];
		 NSArray *photos = [((NSDictionary*)json) arrayForKey:@"photos"];
		 if (photos.count) {
			 for (NSDictionary *photoDic in photos) {
				 [categoryPhotos addObject:[[CLPhoto alloc] initWithDictionary:photoDic]];
			 }
		 }

		 NSUInteger totoalPages = [json unsignedLongForKey:@"total_pages"];

		 dispatch_async(dispatch_get_main_queue(), ^{
			if (completion) {
				completion(categoryPhotos, totoalPages, nil);
			}
		});
	 } onFailure:^(NSError *error) {
		 dispatch_async(dispatch_get_main_queue(), ^{
			if (completion) {
				completion(nil, 0, error);
			}
		});
	 }];
}

@end
