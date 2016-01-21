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
        
        self.photoID = dict[@"id"];
        self.author = dict[@"user"][@"username"];
        self.title = dict[@"name"];
        
        NSArray *images = dict[@"images"];
        for (NSDictionary *imgDict in images) {
            switch ([imgDict[@"size"] integerValue]) {
                case   CLPhotoScalePreview:
                    self.photoPreviewURL = imgDict[@"https_url"];
                    break;
                case CLPhotoScalePhoto:
                    self.photoURL = imgDict[@"https_url"];
                    break;
                default:
                    break;
            }
        }
    }
    return self;
}

@end
