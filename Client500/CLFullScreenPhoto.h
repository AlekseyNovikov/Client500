//
//  CLFullScreenPhoto.h
//  Client500
//
//  Created by Aleksey Novikov on 12/11/15.
//  Copyright © 2015 Aleksey Novikov. All rights reserved.
//

#import <NYTPhotoViewer/NYTPhoto.h>

@interface CLFullScreenPhoto : NSObject <NYTPhoto>

// Redeclare all the properties as readwrite for sample/testing purposes.
@property (nonatomic) UIImage *image;
@property (nonatomic) UIImage *placeholderImage;
@property (nonatomic) NSAttributedString *attributedCaptionTitle;
@property (nonatomic) NSAttributedString *attributedCaptionSummary;
@property (nonatomic) NSAttributedString *attributedCaptionCredit;

@end
