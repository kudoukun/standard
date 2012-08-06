//
//  ProductClass.h
//  cheese
//
//  Created by 酒井 邦也 on 12/06/19.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductClass : NSObject{
    
    NSNumber *_product_id;
    NSString *_price02_min;
    NSString *_stock_min;
    NSString *_time_limit;
    NSString *_material;
    NSString *_allergy;
    NSString *_name;
    NSString *_main_comment;
    NSString *_main_image;
    NSString *_sub_image1;
    NSString *_sub_image2;
    NSArray *_categories;
    NSString *_category;
    NSString *_main_list_comment;
    NSDate *_update;
    NSDate *_create;
    
}

@property (copy, nonatomic)NSNumber *product_id;
@property (copy, nonatomic)NSString *price02_min;
@property (copy, nonatomic)NSString *stock;
@property (copy, nonatomic)NSString *time_limit;
@property (copy, nonatomic)NSString *material;
@property (copy, nonatomic)NSString *allergy;
@property (copy, nonatomic)NSString *name;
@property (copy, nonatomic)NSString *main_comment;
@property (copy, nonatomic)NSString *main_image;
@property (copy, nonatomic)NSString *sub_image1;
@property (copy, nonatomic)NSString *sub_image2;
@property (copy, nonatomic)NSString *category;
@property (copy, nonatomic)NSArray *categories;
@property (copy, nonatomic)NSString *main_list_comment;
@property (copy, nonatomic)NSDate *update;
@property (copy, nonatomic)NSDate *create;


- (id)initWithDic:(NSDictionary*)dic;
- (void)setCT:(NSString *)category;

@end
