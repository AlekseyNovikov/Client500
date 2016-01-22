//
//  CLCategoriesViewController.m
//  Client500
//
//  Created by Aleksey Novikov on 21/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import "CLCategoriesViewController.h"
#import "CLPhotoCategory.h"

///cell
#import "CLCategoryCell.h"

#import "CLPhotosViewController.h"

@interface CLCategoriesViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *categoriesTableView;
@property (nonatomic, strong) NSArray *categories;

@end

@implementation CLCategoriesViewController

#pragma mark - Private
- (NSArray *)categories
{
    if (!_categories) {
        NSMutableArray *unsortedArr = [[CLPhotoCategory allCategories] mutableCopy];
        [unsortedArr sortUsingComparator:^(CLPhotoCategory *firstObject, CLPhotoCategory *secondObject) {
            return [firstObject.categoryName caseInsensitiveCompare:secondObject.categoryName];
        }];
        _categories = unsortedArr;
    }
    return _categories;
}

- (void)cl_setupTableView
{
    self.categoriesTableView.contentInset = UIEdgeInsetsZero;
    self.categoriesTableView.delegate = self;
    self.categoriesTableView.dataSource = self;
    self.categoriesTableView.rowHeight = 50.f;
    self.categoriesTableView.tableFooterView = [UIView new];
}

#pragma mark - ViewController life cicle
- (void)viewDidLoad
{
    self.navigationItem.title = @"Categories";
    [self cl_setupTableView];
}


#pragma mark - TableView dataspurce
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CLCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:[CLCategoryCell cellReuseIdentifier]];
    [cell configureWithObject:self.categories[indexPath.row]];
    return cell;
}

#pragma mark - TableView delegate


#pragma mark - Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[CLPhotosViewController class]]) {
        CLPhotosViewController *photocVC = segue.destinationViewController;
        photocVC.category = self.categories[[self.categoriesTableView indexPathForSelectedRow].row];
    }
}
@end
