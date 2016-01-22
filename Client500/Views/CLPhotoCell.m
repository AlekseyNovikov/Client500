//
//  CLPhotoCell.m
//  Client500
//
//  Created by Aleksey Novikov on 22/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import "CLPhotoCell.h"
#import "CLPhoto.h"
///Helpers
#import "UIImage+CLImage.h"

@implementation CLPhotoCell

- (void)awakeFromNib
{
	[self.imgPreview setUserInteractionEnabled:YES];
	UITapGestureRecognizer *tapPhotoGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self
																							   action:@selector(photoTapped:)];
	[self.imgPreview addGestureRecognizer:tapPhotoGestureRecognizer];

}

- (void)configureWithObject:(id)object
{
	if ([object isKindOfClass:[CLPhoto class]]) {
		CLPhoto *photo = object;
		self.authorLabel.text = photo.author;
		self.titleLabel.text = photo.title;
        self.imgPreview.image = [UIImage imageNamed:@"placeholder"];
        [UIImage cl_imageWithUrl:photo.photoPreviewURL
                      completion:^(UIImage *image, NSError *error) {
                          self.imgPreview.image = image;
                      }];
    }
}


- (void)prepareForReuse
{
	self.imgPreview.image = nil;
}


- (IBAction)photoTapped:(id)sender
{
	if ([self.delegate respondsToSelector:@selector(cellPhotoDidTapped:)]) {
		[self.delegate cellPhotoDidTapped:self];
	}
}


@end
