//
//  ProductClass.m
//  cheese
//
//  Created by 酒井 邦也 on 12/06/19.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "ProductClass.h"

@implementation ProductClass

@synthesize product_id = _product_id;
@synthesize price02_min = _price02_min;
@synthesize stock = _stock_min;
@synthesize time_limit = _time_limit;
@synthesize material = _material;
@synthesize allergy = _allergy;
@synthesize name = _name;
@synthesize main_comment = _main_comment;
@synthesize main_image = _main_image;
@synthesize sub_image1 = _sub_image1;
@synthesize sub_image2 = _sub_image2;
@synthesize category = _category;
@synthesize categories = _categories;
@synthesize main_list_comment = _main_list_comment;
@synthesize update = _update;
@synthesize create = _create;

- (id)initWithDic:(NSDictionary*)dic{
    
    self.product_id = [dic objectForKey:@"product_id"];
    self.price02_min = [dic objectForKey:@"price02_min"];
    self.stock = [dic objectForKey:@"stock_min"];
    self.time_limit = [dic objectForKey:@"time_limit"];
    self.material = [dic objectForKey:@"material"];
    self.allergy = [dic objectForKey:@"allergy"];
    self.name = [dic objectForKey:@"name"];
    self.main_comment = [dic objectForKey:@"main_comment"];
    self.main_image = [dic objectForKey:@"main_image"];
    self.sub_image1 = [dic objectForKey:@"sub_image1"];
    self.sub_image2 = [dic objectForKey:@"sub_image2"];
    self.categories = [dic objectForKey:@"categories"];
    self.main_list_comment = [dic objectForKey:@"main_list_comment"];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setTimeStyle:NSDateFormatterNoStyle];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    self.update = [df dateFromString:[dic objectForKey:@"create_date"]];
    self.create = [df dateFromString:[dic objectForKey:@"update_date"]];
    NSLog(@"%@",self.update);
    
    return self;
}
- (void)setCT:(NSString *)category{
    
    _category = category;           
        
}

@end
