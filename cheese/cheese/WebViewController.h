//
//  WebViewController.h
//  cheese
//
//  Created by 酒井 邦也 on 12/06/22.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>{
    
    NSString *_path;
    IBOutlet UIWebView *_webview;
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil link:(NSString *)path;

@end
