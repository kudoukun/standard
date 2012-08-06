//
//  MainMasterViewController.h
//  cheese
//
//  Created by 酒井 邦也 on 12/06/15.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductUserDefaults.h"
#import "Entity.h"

@class MainDetailViewController;

@interface MainMasterViewController : UIViewController{
    
     NSArray *_data;
    IBOutlet UITableView *_kategoryTable;
    
    NSUserDefaults *def;
    NSArray *item;
    
}



@property (strong, nonatomic) MainDetailViewController *detailViewController;
@property (strong, nonatomic) IBOutlet UITableView *kategoryTaboe;
@property (retain, nonatomic) NSArray *data;
@property (retain, nonatomic) UIBarButtonItem *leftItem;
@end
