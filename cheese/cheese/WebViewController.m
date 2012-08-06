//
//  WebViewController.m
//  cheese
//
//  Created by 酒井 邦也 on 12/06/22.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil link:(NSString *)path
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _path = path;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _webview.delegate = self;
    
    NSLog(@"%@",_path);
    
    NSURL * url = [[NSURL alloc] initWithString:_path];
    NSURLRequest * req = [[NSURLRequest alloc] initWithURL:url];
    [_webview loadRequest:req];  
    _webview.scalesPageToFit = YES;
    
}

- (void)viewDidUnload
{
    _webview = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
