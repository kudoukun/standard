//
//  MainTableViewCell.m
//  cheese
//
//  Created by 酒井 邦也 on 12/06/18.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell
@synthesize label1;
@synthesize images;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.label1.minimumFontSize = 10.0;
        self.label1.adjustsFontSizeToFitWidth = YES;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
