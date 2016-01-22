//
//  CLPhotosTableDataSource.m
//  Client500
//
//  Created by Aleksey Novikov on 22/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import "CLPhotosTableDataSource.h"

@interface CLPhotosTableDataSource ()

@property (nonatomic, strong) NSMutableArray *rows;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;

@end

@implementation CLPhotosTableDataSource

- (instancetype)initCellReuseIdentifier:(NSString *)cellIdentifier
                     configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock
{
    self = [super init];
    if (self) {
        self.rows = [NSMutableArray array];
        self.cellIdentifier = cellIdentifier;
        self.configureCellBlock = [configureCellBlock copy];
    }
    return self;
}

- (NSUInteger)addNewRows:(NSArray *)rows
{
    [self.rows addObjectsFromArray:rows];
    return self.rows.count;
}

- (id)rowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.rows[(NSUInteger) indexPath.row];
}

#pragma mark - TableView datasource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    id row = [self rowAtIndexPath:indexPath];
    self.configureCellBlock(cell, row);
    return cell;
}

@end
