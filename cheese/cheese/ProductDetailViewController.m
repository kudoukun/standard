//
//  ProductDetailViewController.m
//  cheese
//
//  Created by 酒井 邦也 on 12/06/21.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "ProductDetailViewController.h"



@implementation ProductDetailViewController

@synthesize detail;

- (IBAction)sizeHeight:(id)sender {
    
    NSLog(@"%f",_main_comment.scrollView.contentSize.height);
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil item:(ProductUserDefaults *)item
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.detail = item;
        self.title = item.name;
    }
    return self;
}
- (void)product_landscape{
    
    
    NSLog(@"テスト成功");
}

- (void)interraction:(UIInterfaceOrientation)toInterfaceOrientation{
    
    
    if(toInterfaceOrientation == UIInterfaceOrientationPortrait ||
	   toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){  
        
        
        [UIView animateWithDuration:1.0f 
                              delay:0.0f 
                            options:UIViewAnimationCurveEaseIn 
                         animations:^(void) 
         {     		 
             
         } completion:^(BOOL finished) {
             
         }];
    }else{
       
        /*
        NSLog(@"%f",_main_comment.scrollView.contentSize.height);
        _main_comment.frame = CGRectMake(_main_comment.frame.origin.x, _main_comment.frame.origin.y, _main_comment.frame.size.width, _main_comment.scrollView.contentSize.height);
        scroll.frame = CGRectMake(0,0,704,563);
        scroll.contentSize =CGSizeMake(scroll.contentSize.width, _main_comment.frame.origin.y+_main_comment.scrollView.contentSize.height+50);
        */
        
    }
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    
    
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _top_label.text = self.detail.name;
    _middle_label.text = self.detail.name;
    _main_comment.delegate = self;
    
    NSString *web = [NSString stringWithFormat:@"<table ><tbody><tr><td width='200' valign='middle' align='center' style='background-color: #EFEFEF; background-color: #EFEFEF; color: #666666; font-size: 16px; font-weight: bold; padding: 5px; ' class='title03'>原材料名</td><td valign='middle' align='left' style='background-color: #EFEFEF; background-color: #EFEFEF; color: #666666; font-size: 16px; font-weight: bold; padding: 5px; ' class='title03'>%@</td></tr><tr><td width='63' valign='middle' align='center' style='background-color: #EFEFEF; background-color: #EFEFEF; color: #666666; font-size: 16px; font-weight: bold; padding: 5px; ' class='title03'>賞味期限</td><td valign='middle' align='left' style='background-color: #EFEFEF; background-color: #EFEFEF; color: #666666; font-size: 16px; font-weight: bold; padding: 5px; ' class='title03'> %@</td></tr><tr><td width='63' valign='middle' align='center' style='background-color: #EFEFEF; background-color: #EFEFEF; color: #666666; font-size: 16px; font-weight: bold; padding: 5px; ' class='title03'>アレルギー</td><td valign='middle' align='left' style='background-color: #EFEFEF; background-color: #EFEFEF; color: #666666; font-size: 16px; font-weight: bold; padding: 5px; ' class='title03'>%@</td></tr><tr><td width='63' valign='middle' align='center' style='background-color: #EFEFEF; background-color: #EFEFEF; color: #666666; font-size: 16px; font-weight: bold; padding: 5px; ' class='title03'> 値段</td><td valign='middle' align='left' style='background-color: #EFEFEF; background-color: #EFEFEF; color: #666666; font-size: 16px; font-weight: bold; padding: 5px; ' class='title03'>%@ 円（税込）</td></tr></tbody></table>",self.detail.material,self.detail.time_limit,self.detail.allergy,self.detail.price02_min];
    
    //[_tableview loadHTMLString:web baseURL:nil];
    
    
    NSString *jsString1 = [NSString stringWithFormat:@"document.write(\"%@\"); document.close();", web];
    
    [_tableview stringByEvaluatingJavaScriptFromString:jsString1];
    
    _tableview.frame = CGRectMake(_tableview.frame.origin.x, _tableview.frame.origin.y, _tableview.frame.size.width,_tableview.scrollView.contentSize.height);
    
    NSString *str = [self.detail.main_comment stringByReplacingOccurrencesOfString:@"\"" withString:@"'"];
    NSString *str1 = [str stringByReplacingOccurrencesOfString:@"\\n" withString:@"<br>"];
    NSLog(@"%@",str1);
    NSString *jsString = [NSString stringWithFormat:@"document.write(\"%@\"); document.close();", str1];
    [_main_comment stringByEvaluatingJavaScriptFromString:jsString];
    NSLog(@"%f",_main_comment.scrollView.contentSize.height);
    _main_comment.frame = CGRectMake(_main_comment.frame.origin.x, _tableview.frame.origin.y+_tableview.scrollView.contentSize.height+20, _main_comment.frame.size.width, _main_comment.scrollView.contentSize.height);
    scroll.contentSize =CGSizeMake(scroll.contentSize.width, _main_comment.frame.origin.y+_main_comment.scrollView.contentSize.height);
    
    
    
    
    _sub_image1.image = [[UIImage alloc]initWithData:self.detail.subIMG1];
    _sub_image2.image = [[UIImage alloc]initWithData:self.detail.subIMG2];
    _main_image.image = [[UIImage alloc]initWithData:self.detail.mainIMG];
    
    if([self.detail.product_id intValue] != 33){
        
        _material.text = self.detail.material;
        _time_limit.text = self.detail.time_limit;   
        _allergy.text = self.detail.allergy;
        
    }
    _price02_min.text = [NSString stringWithFormat:@"%@円(税込み)", self.detail.price02_min];
    
    [NSTimer scheduledTimerWithTimeInterval:1.5f
                                                  target:self
                                                selector:@selector(hogeMethod)userInfo:nil                  repeats:NO
     ];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    /*
    if(navigationType == UIWebViewNavigationTypeLinkClicked) {
        
        NSString *query = [NSString stringWithFormat:@"http://www.cheesecake.co.jp/products/detail15.html"];
        
        WebViewController *web = [[WebViewController alloc]initWithNibName:@"WebViewController" bundle:nil link:query];
        [self.navigationController pushViewController:web animated:YES];
        
        return  YES;
        
    }   */
    return NO;
}

- (void)viewDidUnload
{
    
    _top_label = nil;
    _middle_label = nil;
    _main_image = nil;
    _sub_image1 = nil;
    _sub_image2 = nil;
    _main_comment = nil;
    scroll = nil;
    _material = nil;
    _time_limit = nil;
    _allergy = nil;
    _price02_min = nil;
    main_View = nil;
    _tableview = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)hogeMethod{
    
     _tableview.frame = CGRectMake(_tableview.frame.origin.x, _tableview.frame.origin.y, _tableview.frame.size.width,_tableview.scrollView.contentSize.height);
    _main_comment.frame = CGRectMake(_main_comment.frame.origin.x, _tableview.frame.origin.y+_tableview.scrollView.contentSize.height+20, _main_comment.frame.size.width, _main_comment.scrollView.contentSize.height);
    scroll.contentSize =CGSizeMake(scroll.contentSize.width, _main_comment.frame.origin.y+_main_comment.scrollView.contentSize.height);
}

@end
