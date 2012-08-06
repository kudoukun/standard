//
//  MainAppDelegate.m
//  cheese
//
//  Created by 酒井 邦也 on 12/06/15.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "MainAppDelegate.h"

#import "MainMasterViewController.h"

#import "MainDetailViewController.h"
#import "SBJson.h"
#import <sqlite3.h>

@implementation MainAppDelegate

@synthesize window = _window;
@synthesize splitViewController = _splitViewController;
@synthesize topViewController = _topViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    [Entity getInstance].detailFlag = NO;
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if(orientation == UIInterfaceOrientationPortrait ||
       orientation == UIInterfaceOrientationPortraitUpsideDown){  
        // 縦
        [Entity getInstance].orientations = @"Portrait";   
    }else{
        //横
        [Entity getInstance].orientations = @"Landscape";
    }
    self.topViewController = [[TopViewController alloc]initWithNibName:@"TopViewController" bundle:nil];
    
    MainMasterViewController *masterViewController = [[MainMasterViewController alloc] initWithNibName:@"MainMasterViewController" bundle:nil];
    
    
    
    UINavigationController *masterNavigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
    
    MainDetailViewController *detailViewController = [[MainDetailViewController alloc] initWithNibName:@"MainDetailViewController" bundle:nil];
    UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    
    
    
    
    
    
    masterViewController.detailViewController = detailViewController;
    
    self.splitViewController = [[MGSplitViewController alloc]initWithNibName:@"SplitOverRideViewController" bundle:nil];
    
    self.splitViewController.splitPosition = 100.0f;
    
    self.splitViewController.delegate = detailViewController;
    detailViewController.splitViewController = self.splitViewController;
    
    
    
    self.splitViewController.viewControllers = [NSArray arrayWithObjects:masterNavigationController, detailNavigationController, nil];
    
    self.window.rootViewController = self.topViewController;
    [self.window makeKeyAndVisible];
    return YES;
    
    
    
    
    
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



/*
 - (void)loadStatus {
 NSString *s = [NSString stringWithFormat:@"http://cheesecake.co.jp/api/?action=product_search&category_id=4&format=xml"];
 NSURL *url = [NSURL URLWithString:s];
 NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
 [parser setDelegate:self];
 [parser parse];
 name = [[NSMutableArray alloc]init];
 product_id = [[NSMutableArray alloc]init];
 price02_min = [[NSMutableArray alloc]init];
 stock = [[NSMutableArray alloc]init];
 time_limit = [[NSMutableArray alloc]init];
 material = [[NSMutableArray alloc]init];
 allergy = [[NSMutableArray alloc]init];
 }
 
 
 // 要素の開始タグを読み込み
 - (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
 
 currentElement = [elementName copy];
 
 if ([elementName isEqualToString:@"item"]) {
 
 }
 }
 
 // 要素の閉じタグを読み込み
 - (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
 if ([elementName isEqualToString:@"item"]) {
 
 NSLog(@"%@",[name objectAtIndex:0]);
 NSLog(@"%@",[product_id objectAtIndex:0]);
 NSLog(@"%@",[price02_min objectAtIndex:0]);
 NSLog(@"%@",[stock objectAtIndex:0]);
 NSLog(@"%@",[time_limit objectAtIndex:0]);
 NSLog(@"%@",[material objectAtIndex:0]);
 NSLog(@"%@",[allergy objectAtIndex:0]);
 
 }
 
 
 }
 
 // テキストデータ読み込み
 - (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
 // テキストデータは複数回に分けて呼び出されることがあるので注意
 if ([currentElement isEqualToString:@"name"]) {
 [name addObject:string];
 NSLog(@"%@",string);
 }else if([currentElement isEqualToString:@"product_id"]){
 NSLog(@"%@",string);
 [product_id addObject:string];
 }else if([currentElement isEqualToString:@"price02_min"]){
 [price02_min addObject:string];
 NSLog(@"%@",string);
 }else if([currentElement isEqualToString:@"stock"]){
 [stock addObject:string];
 NSLog(@"%@",string);
 }else if([currentElement isEqualToString:@"time_limit"]){
 [time_limit addObject:string];
 NSLog(@"%@",string);
 }else if([currentElement isEqualToString:@"material"]){
 [material addObject:string];
 NSLog(@"%@",string);
 }else if([currentElement isEqualToString:@"allergy"]){
 [allergy addObject:string];
 NSLog(@"%@",string);
 }
 }
 */

@end
