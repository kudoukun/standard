//
//  MainAppDelegate.h
//  cheese
//
//  Created by 酒井 邦也 on 12/06/15.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplitOverRideViewController.h"
#import "TopViewController.h"
#import "ProductClass.h"
#import "ProductUserDefaults.h"
#import "MGSplitViewController.h"
#import "Entity.h"
#import <sqlite3.h>



@interface MainAppDelegate : UIResponder <UIApplicationDelegate,MGSplitViewControllerDelegate>{
    
    sqlite3* db;    
    NSString* work_path;
    NSString* database_filename;    
    NSString* database_path;    
    NSString* template_path;
    
    NSMutableArray *getJson;
    
    UIActivityIndicatorView *m_indicator;
    
    BOOL inNameElement;
    BOOL inTextElement;
    
    NSString *currentElement;
    
    NSUserDefaults *def;
    
    ProductUserDefaults *pud;
    
    NSMutableArray *name;
    NSMutableArray *product_id;
    NSMutableArray *price02_min;
    NSMutableArray *stock;
    NSMutableArray *time_limit;
    NSMutableArray *material;
    NSMutableArray *allergy;
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connectionDidFinishLoading:
(NSURLConnection *)connection;
@property (strong, nonatomic) UIWindow *window;

@property (retain, nonatomic) MGSplitViewController *splitViewController;

@property (strong, nonatomic)TopViewController *topViewController;

- (void)loadStatus;


@end
