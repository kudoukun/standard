//
//  ProductDetailViewController.h
//  cheese
//
//  Created by 酒井 邦也 on 12/06/21.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductUserDefaults.h"
#import "WebViewController.h"

@protocol Product_Landscape
- (void)product_landscape;
@end

@interface ProductDetailViewController : UIViewController<UIWebViewDelegate,Product_Landscape>{
    
    IBOutlet UILabel *_top_label;
    IBOutlet UILabel *_middle_label;
    IBOutlet UIImageView *_main_image;
    IBOutlet UIImageView *_sub_image1;
    IBOutlet UIImageView *_sub_image2;
    IBOutlet UIWebView *_main_comment;
    IBOutlet UIScrollView *scroll;
    
    IBOutlet UITextView *_material;
    IBOutlet UITextView *_time_limit;
    IBOutlet UITextView *_allergy;
    IBOutlet UITextView *_price02_min;
    
    IBOutlet UIView *main_View;
    IBOutlet UIWebView *_tableview;
    
    
}

@property (retain,nonatomic) ProductUserDefaults *detail;


- (IBAction)sizeHeight:(id)sender;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil item:(ProductUserDefaults *)item;
- (void)interraction:(UIInterfaceOrientation)toInterfaceOrientation;

@end
