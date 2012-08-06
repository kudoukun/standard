//
//  TopViewController.h
//  cheese
//
//  Created by 酒井 邦也 on 12/06/18.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplitOverRideViewController.h"
#import "MainMasterViewController.h"
#import "MainDetailViewController.h"
#import "ProductUserDefaults.h"
#import "MGSplitViewController.h"
#import "MGSplitDividerView.h"
#import "Entity.h"
#import "ProductUserDefaults.h"
#import <sqlite3.h>


@interface TopViewController : UIViewController{
    
    sqlite3 *db_;
    NSString *work_path;
    NSString *database_filename;
    NSString *database_path;
    NSString *template_path;
    
    sqlite3_stmt *statement;
    NSString *sql;
    NSInteger param_index;
    
    
    
    MainMasterViewController *masterViewController;
    MainDetailViewController *detailViewController;
    IBOutlet UIImageView *main_image;
    IBOutlet UIImageView *sub_image1;
    IBOutlet UIImageView *sub_image2;
    IBOutlet UIButton *update;
    
    UIImageView *image;
    
    UIActivityIndicatorView *m_indicator; // インジケータ
    NSMutableArray *getJson;
    NSUserDefaults *def;
    ProductUserDefaults *pud;
    
    IBOutlet UIButton *product;
    IBOutlet UIImageView *topImage;
}

@property (strong, nonatomic) IBOutlet UIButton *next;

@property (strong, nonatomic)MGSplitViewController *splitViewController;
- (IBAction)next:(id)sender;
@property (retain, nonatomic) IBOutlet UIView *mainView;
- (IBAction)update:(id)sender;

@end
