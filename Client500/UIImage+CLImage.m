//
//  UIImage+CLImage.m
//  Client500
//
//  Created by Aleksey Novikov on 23/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import "UIImage+CLImage.h"
#import <SDWebImage/SDWebImageManager.h>


@implementation UIImage (CLImage)

+ (void)cl_imageWithUrl:(NSURL *)url
			 completion:(void (^)(UIImage *image, NSError *error))completion
{

	[[SDWebImageManager sharedManager]
	 downloadImageWithURL:url
				  options:0
				 progress:nil
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
		 if (completion) {
			 completion(image, error);
		 }
	 }];
}
@end
