//
//  TSNetworkManager+Photos.m
//  Client500
//
//  Created by Aleksey Novikov on 21/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import "TSNetworkManager.h"
#import "CLPhotoCategory.h"

@implementation TSNetworkManager (Photos)
//https://api.500px.com/v1/photos?only=Nude&page=5&image_size=2,4&consumer_key=KvOmAIiUyOlihwz4JkUdAjB2zXzKnvek5169dPmV

- (void)photosFromCategory:(CLPhotoCategoryName)category
                      page:(NSUInteger)page
                completion:(void(^)(NSArray *photos, NSUInteger pageCount, NSError *error))completion
{
    NSString *categoryName = [CLPhotoCategory categoryStringNameForCategory:category];
    NSString *urlQueryString = [NSString stringWithFormat:@"%@?consumer_key=%@&image_size=2,4&only=%@", photos, consumerKey, [categoryName stringByReplacingOccurrencesOfString:@" " withString:@"+"]];
    [self performRequestToServer:urlQueryString
                       onSuccess:^(id json) {
                           
                       } onFailure:^(NSError *error) {
                           
                       }];
}

@end
