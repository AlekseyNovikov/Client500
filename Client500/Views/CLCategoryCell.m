//
//  CLCategoryCell.m
//  Client500
//
//  Created by Aleksey Novikov on 21/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import "CLCategoryCell.h"
#import "CLPhotoCategory.h"

@interface CLCategoryCell ()
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@end

@implementation CLCategoryCell

-(void)configureWithObject:(id)object
{
    if ([object isKindOfClass:[CLPhotoCategory class]]) {
        CLPhotoCategory *category = object;
        self.categoryLabel.text = category.categoryName;
    }
}

@end
