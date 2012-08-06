//
//  TableViewCellCustomCell.h
//  cheese
//
//  Created by 酒井 邦也 on 12/06/15.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCellCustomCell : UITableViewCell{
    
    UIImageView* imageView;
    UILabel* label1;
    UILabel* label2;
    UILabel* label3;
    UIImageView *_cell_back;
    
}
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UILabel *label3;
@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property (strong, nonatomic) IBOutlet UIImageView *cell_back;

@end
