//
//  CLPhoto.h
//  Client500
//
//  Created by Aleksey Novikov on 21/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, CLPhotoScale)
{
    CLPhotoScalePreview = 2,
    CLPhotoScalePhoto = 4,
};

@interface CLPhoto : NSObject

@property (nonatomic, strong) NSNumber *photoID;
@property (nonatomic, strong) NSURL *photoPreviewURL;
@property (nonatomic, strong) NSURL *photoURL;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *title;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
    