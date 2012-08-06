//
//  Entity.m
//  cheese
//
//  Created by 酒井 邦也 on 12/06/15.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "Entity.h"

@implementation Entity

@synthesize categoryFlag = _categoryFlag;
@synthesize orientations = _orientations;
@synthesize detailFlag;

static Entity *entity = nil;
+(Entity *)getInstance{
    if(!entity){
        entity = [[Entity alloc]init];
    }
    return entity;
}

@end
