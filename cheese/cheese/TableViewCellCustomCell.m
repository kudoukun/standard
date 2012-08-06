//
//  TableViewCellCustomCell.m
//  cheese
//
//  Created by 酒井 邦也 on 12/06/15.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "TableViewCellCustomCell.h"

@implementation TableViewCellCustomCell
@synthesize imageView;
@synthesize label1;
@synthesize label2;
@synthesize label3;
@synthesize webview;
@synthesize cell_back;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self.label1 setLineBreakMode:UILineBreakModeWordWrap];
        [self.label2 setLineBreakMode:UILineBreakModeWordWrap];
        [self.label3 setLineBreakMode:UILineBreakModeWordWrap];
        [self.label1 setNumberOfLines:1];
        [self.label2 setNumberOfLines:1];
        [self.label3 setNumberOfLines:1];
        self.label1.minimumFontSize = 30.0;
        self.label2.minimumFontSize = 10.0;
        self.label3.minimumFontSize = 10.0;
        self.label1.adjustsFontSizeToFitWidth = NO;
        self.label2.adjustsFontSizeToFitWidth = YES;
        self.label3.adjustsFontSizeToFitWidth = YES;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
