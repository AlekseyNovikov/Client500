//
//  CLTableViewCell.h
//  Client500
//
//  Created by Aleksey Novikov on 22/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLTableViewCell : UITableViewCell

- (void)configureWithObject:(id)object;

+ (UINib *)nib;
+ (NSString *)cellReuseIdentifier;

@end
