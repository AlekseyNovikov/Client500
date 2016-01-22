//
//  CLPhoto.h
//  Client500
//
//  Created by Aleksey Novikov on 21/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import <NYTPhotoViewer/NYTPhoto.h>

typedef NS_ENUM (NSInteger, CLPhotoScale)
{
	CLPhotoScalePreview = 2,
	CLPhotoScalePhoto = 4,
};

@interface CLPhoto : NSObject <NYTPhoto>

@property (nonatomic, strong) NSNumber *photoID;
@property (nonatomic, strong) NSURL *photoPreviewURL;
@property (nonatomic, strong) NSURL *photoURL;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *photoDescription;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

///NYTPhoto
@property (nonatomic) UIImage *image;
@property (nonatomic) NSData *imageData;
@property (nonatomic) UIImage *placeholderImage;
@property (nonatomic) NSAttributedString *attributedCaptionTitle;
@property (nonatomic) NSAttributedString *attributedCaptionSummary;
@property (nonatomic) NSAttributedString *attributedCaptionCredit;


@end
