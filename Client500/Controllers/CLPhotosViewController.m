//
//  CLPhotosViewController.m
//  Client500
//
//  Created by Aleksey Novikov on 22/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import "CLPhotosViewController.h"

#import "CLPhotoCategory.h"
#import "CLPhotosTableDataSource.h"

#import "CLPhotoCell.h"
#import "CLPhoto.h"

#import "TSNetworkManager.h"

@interface CLPhotosViewController ()<UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *photosTableView;

@property (nonatomic, strong) CLPhotosTableDataSource *datasource;

@property (nonatomic, assign) NSUInteger curentPage;
@property (nonatomic, assign) NSUInteger totalPages;
@property (nonatomic, assign) NSUInteger totalPhotos;

@property (nonatomic, assign) BOOL loading;

@end

@implementation CLPhotosViewController

#pragma mark - private
- (void)setLoading:(BOOL)loading
{
    if (_loading != loading) {
        _loading = loading;
        
        if (_loading) {
            UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            indicator.contentMode = UIViewContentModeCenter;
            
            CGRect frame = indicator.frame;
            frame.size.height = 44.0;
            indicator.frame = frame;
            
            [indicator startAnimating];
            
            self.photosTableView.tableFooterView = indicator;
        }
        else {
            self.photosTableView.tableFooterView = nil;
        }
    }
}

- (void)cl_loadDataPage:(NSUInteger)page
{
    self.loading = YES;
    [[TSNetworkManager sharedManager] photosFromCategory:self.category
                                                    page:page
                                              completion:^(NSArray *photos, NSUInteger pageCount, NSError *error) {
                                                  if (error) {
                                                      NSLog(@"Error loading photos %@", error.localizedDescription);
                                                  }
                                                  self.totalPages = pageCount;
                                                  self.totalPhotos = [self.datasource addNewRows:photos];
                                                  [self.photosTableView reloadData];
                                                  self.loading = NO;
                                              }];
}

- (void)cl_setUpTableView
{
    TableViewCellConfigureBlock configureBLock =  ^(CLPhotoCell *cell, CLPhoto *photo) {
        [cell configureWithObject:photo];
    };
    self.datasource = [[CLPhotosTableDataSource alloc] initCellReuseIdentifier:[CLPhotoCell cellReuseIdentifier]
                                                 configureCellBlock:configureBLock];
    self.photosTableView.dataSource = self.datasource;
    self.photosTableView.delegate = self;
    self.photosTableView.rowHeight = 120.f;
    self.photosTableView.tableFooterView = [UIView new];
    
}


#pragma mark - ViewController life cicle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.category.categoryName;
    self.navigationItem.backBarButtonItem.tintColor = [UIColor blackColor];

    [self cl_setUpTableView];
    [self cl_loadDataPage:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView delegte

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == (self.totalPhotos - 1)) {
        self.curentPage++;
        if (self.curentPage < self.totalPages) {
            [self cl_loadDataPage:self.curentPage];
        }
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
