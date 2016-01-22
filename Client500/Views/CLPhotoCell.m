//
//  CLPhotoCell.m
//  Client500
//
//  Created by Aleksey Novikov on 22/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import "CLPhotoCell.h"
#import "CLPhoto.h"

@interface CLPhotoCell ()
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgPreview;

@end

@implementation CLPhotoCell

-(void)configureWithObject:(id)object
{
    if ([object isKindOfClass:[CLPhoto class]]) {
        CLPhoto *photo = object;
        self.authorLabel.text = photo.author;
        self.titleLabel.text = photo.title;
    }
}

@end
