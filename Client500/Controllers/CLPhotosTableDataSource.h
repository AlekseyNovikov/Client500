//
//  CLPhotosTableDataSource.h
//  Client500
//
//  Created by Aleksey Novikov on 22/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id row);

@interface CLPhotosTableDataSource : NSObject <UITableViewDataSource>

- (instancetype)initCellReuseIdentifier:(NSString *)cellIdentifier
                     configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock;

- (NSUInteger)addNewRows:(NSArray *)rows;

- (id)rowAtIndexPath:(NSIndexPath *)indexPath;

@end
