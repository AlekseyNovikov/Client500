//
//  UIImage+CLImage.h
//  Client500
//
//  Created by Aleksey Novikov on 23/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CLImage)

+ (void)cl_imageWithUrl:(NSURL *)url
             completion:(void (^)(UIImage *image, NSError *error))completion;
@end
