//
//  MainDetailViewController.h
//  cheese
//
//  Created by 酒井 邦也 on 12/06/15.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCellCustomCell.h"
#import "ProductDetailViewController.h"
#import "ProductUserDefaults.h"
#import "Entity.h"
#import "MGSplitViewController.h"

@interface MainDetailViewController : UIViewController <MGSplitViewControllerDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    
    IBOutlet UITableView *_categoryTable;
    UIInterfaceOrientation _orientation;
    NSString *_orientations;
    TableViewCellCustomCell *cell;
    
    NSUserDefaults *def;
    NSArray *item;
    IBOutlet UIImageView *detail_top;
    
}

@property (retain, nonatomic)ProductDetailViewController *product;

@property (strong, nonatomic) id detailItem;
@property (assign,nonatomic)NSInteger section;
@property (retain,nonatomic)NSArray *arr;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UITableView *categoryTable;
@property (strong, nonatomic) MGSplitViewController *splitViewController;
@property (assign, nonatomic)UIInterfaceOrientation orientation;
@property (copy,nonatomic)NSString *orientations;

- (void)cellChage:(UIInterfaceOrientation)toInterfaceOrientation;

- (void)Notifi:(NSString *)orien;
@end
