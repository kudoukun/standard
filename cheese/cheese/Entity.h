//
//  Entity.h
//  cheese
//
//  Created by 酒井 邦也 on 12/06/15.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entity : NSObject{
    
    
    
}

@property(copy,nonatomic)NSString *orientations;
@property(assign,nonatomic)NSInteger *categoryFlag;
@property(assign, nonatomic)BOOL detailFlag;

+ (Entity *)getInstance;

@end
