//
//  CLPhotoCell.h
//  Client500
//
//  Created by Aleksey Novikov on 22/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import  "CLTableViewCell.h"
@class CLPhotoCell;

@protocol CLPhotoCellDelegate <NSObject>

-(void)cellPhotoDidTapped:(CLPhotoCell *)cell;

@end

@interface CLPhotoCell : CLTableViewCell 

@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgPreview;

@property (nonatomic, weak) id<CLPhotoCellDelegate> delegate;

@end
