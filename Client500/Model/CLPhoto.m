//
//  CLPhoto.m
//  Client500
//
//  Created by Aleksey Novikov on 21/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import "CLPhoto.h"

@implementation CLPhoto

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        
        self.photoID = [dict objectForKey:@"id"];
        NSDictionary *userDict = [dict dictionaryForKey:@"user"];
        self.author = [userDict stringForKey:@"username"];
        self.title = [dict stringForKey:@"name"];
        self.photoDescription = [dict stringForKey:@"description"];
        
        NSArray *images = [dict arrayForKey:@"images"];
        for (NSDictionary *imgDict in images) {
            switch ([imgDict[@"size"] integerValue]) {
                case   CLPhotoScalePreview:
                    self.photoPreviewURL = [NSURL URLWithString:[imgDict stringForKey:@"https_url"]];
                    break;
                case CLPhotoScalePhoto:
                    self.photoURL = [NSURL URLWithString:[imgDict stringForKey:@"https_url"]];
                    break;
                default:
                    break;
            }
        }
    }
    return self;
}

@end
