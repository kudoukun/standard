//
//  ProductUserDefaults.m
//  cheese
//
//  Created by 酒井 邦也 on 12/06/19.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "ProductUserDefaults.h"

@implementation ProductUserDefaults

@synthesize mainIMG = _mainIMG;
@synthesize subIMG1 = _subIMG1;
@synthesize subIMG2 = _subIMG2;



- (id)initWithObj:(ProductClass *)pdt{
    
    self.product_id = pdt.product_id;
    NSNumber *number = [NSNumber numberWithInt:[pdt.price02_min intValue]];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setPositiveFormat:@",###"];
    self.price02_min = [formatter stringForObjectValue:number];
    self.stock = pdt.stock;
    self.time_limit = pdt.time_limit;
    self.material = pdt.material;
    self.allergy = pdt.allergy;
    self.name = pdt.name;
    self.main_comment = pdt.main_comment;
    self.main_image = pdt.main_image;
    self.sub_image1 = pdt.sub_image1;
    self.sub_image2 = pdt.sub_image2;
    self.categories = pdt.categories;
    self.category = pdt.category;
    self.main_list_comment = pdt.main_list_comment;
    self.create = pdt.create;
    self.update = pdt.update;
    
    NSURL *url1 = [NSURL URLWithString:pdt.main_image];
    _mainIMG  = [NSData dataWithContentsOfURL:url1];
    NSURL *url2 = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.cheesecake.co.jp/upload/save_image/%@", pdt.sub_image1]];
    _subIMG1  = [NSData dataWithContentsOfURL:url2];
    NSURL *url3 = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.cheesecake.co.jp/upload/save_image/%@", pdt.sub_image2]];
    _subIMG2  = [NSData dataWithContentsOfURL:url3];
       return self;
}

- (void)userDefaults:(ProductUserDefaults *)pud{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSMutableArray *item = [def objectForKey:@"PRODUCT"]; 
        
    if (item == nil) {
        dic1 = [[NSMutableDictionary alloc]init];
        dic2 = [[NSMutableDictionary alloc]init];
        dic3 = [[NSMutableDictionary alloc]init];
        dic4 = [[NSMutableDictionary alloc]init];
        dic5 = [[NSMutableDictionary alloc]init];
        dic6 = [[NSMutableDictionary alloc]init];
        dic7 = [[NSMutableDictionary alloc]init];
        
        arr1 = [[NSMutableArray alloc]init];
        arr2 = [[NSMutableArray alloc]init];
        arr3 = [[NSMutableArray alloc]init];
        arr4 = [[NSMutableArray alloc]init];
        arr5 = [[NSMutableArray alloc]init];
        arr6 = [[NSMutableArray alloc]init];
        arr7 = [[NSMutableArray alloc]init];
        
        [dic1 setObject:@"オリジナル" forKey:@"TITLE"];
        [dic1 setObject:pud.category forKey:@"CATEGORY"];
        [dic2 setObject:@"限定商品" forKey:@"TITLE"];
        [dic2 setObject:pud.category forKey:@"CATEGORY"];
        [dic3 setObject:@"チーズバー" forKey:@"TITLE"];
        [dic3 setObject:pud.category forKey:@"CATEGORY"];
        [dic4 setObject:@"ホールケーキ" forKey:@"TITLE"];
        [dic4 setObject:pud.category forKey:@"CATEGORY"];
        [dic5 setObject:@"スペシャルメニュー" forKey:@"TITLE"];
        [dic5 setObject:pud.category forKey:@"CATEGORY"];
        [dic6 setObject:@"石畳チーズ" forKey:@"TITLE"];
        [dic6 setObject:pud.category forKey:@"CATEGORY"];
        [dic7 setObject:@"ギフト＆ラッピング" forKey:@"TITLE"];
        [dic7 setObject:pud.category forKey:@"CATEGORY"];
    }else{    
        dic1 = [[NSMutableDictionary alloc]initWithDictionary:[item objectAtIndex:0]];
        dic2 = [[NSMutableDictionary alloc]initWithDictionary:[item objectAtIndex:1]];
        dic3 = [[NSMutableDictionary alloc]initWithDictionary:[item objectAtIndex:2]];
        dic4 = [[NSMutableDictionary alloc]initWithDictionary:[item objectAtIndex:3]];
        dic5 = [[NSMutableDictionary alloc]initWithDictionary:[item objectAtIndex:4]];
        dic6 = [[NSMutableDictionary alloc]initWithDictionary:[item objectAtIndex:5]];
        dic7 = [[NSMutableDictionary alloc]initWithDictionary:[item objectAtIndex:6]];
        
        arr1 = [[NSMutableArray alloc]initWithArray:[dic1 objectForKey:@"ITEM"]];
        arr2 = [[NSMutableArray alloc]initWithArray:[dic2 objectForKey:@"ITEM"]];
        arr3 = [[NSMutableArray alloc]initWithArray:[dic3 objectForKey:@"ITEM"]];
        arr4 = [[NSMutableArray alloc]initWithArray:[dic4 objectForKey:@"ITEM"]];
        arr5 = [[NSMutableArray alloc]initWithArray:[dic5 objectForKey:@"ITEM"]];
        arr6 = [[NSMutableArray alloc]initWithArray:[dic6 objectForKey:@"ITEM"]];
        arr7 = [[NSMutableArray alloc]initWithArray:[dic7 objectForKey:@"ITEM"]];
    }
        
    [self setValue:self.product_id forKey:@"product_id"];
    [self setValue:self.price02_min forKey:@"price02_min"];
    [self setValue:self.stock forKey:@"stock"];
    [self setValue:self.time_limit forKey:@"time_limit"];
    [self setValue:self.material forKey:@"material"];
    [self setValue:self.allergy forKey:@"allergy"];
    [self setValue:self.name forKey:@"name"];
    [self setValue:self.main_comment forKey:@"main_comment"];
    [self setValue:self.main_image forKey:@"main_image"];
    [self setValue:self.sub_image1 forKey:@"sub_image1"];
    [self setValue:self.sub_image2 forKey:@"sub_image2"];
    [self setValue:self.categories forKey:@"categories"];
    [self setValue:self.category forKey:@"category"];
    [self setValue:self.main_list_comment forKey:@"main_list_comment"];
    [self setValue:self.create forKey:@"create"];
    [self setValue:self.update forKey:@"update"];
    [self setValue:self.mainIMG forKey:@"mainIMG"];
    [self setValue:self.subIMG1 forKey:@"subIMG1"];
    [self setValue:self.subIMG2 forKey:@"subIMG2"];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    
    if([pud.category isEqualToString:@"1"]){
        [arr1 addObject:data];
        [dic1 setObject:arr1 forKey:@"ITEM"];
    }else if([pud.category isEqualToString:@"2"]){
        [arr2 addObject:data];
        [dic2 setObject:arr2 forKey:@"ITEM"];
    }else if([pud.category isEqualToString:@"3"]){
        [arr3 addObject:data];
        [dic3 setObject:arr3 forKey:@"ITEM"];
    }else if([pud.category isEqualToString:@"4"]){
        [arr4 addObject:data];
        [dic4 setObject:arr4 forKey:@"ITEM"];
    }else if([pud.category isEqualToString:@"5"]){
        [arr5 addObject:data];
        [dic5 setObject:arr5 forKey:@"ITEM"];
    }else if([pud.category isEqualToString:@"6"]){
        [arr6 addObject:data];
        [dic6 setObject:arr6 forKey:@"ITEM"];
    }else if([pud.category isEqualToString:@"7"]){
        [arr7 addObject:data];
        [dic7 setObject:arr7 forKey:@"ITEM"];
    }
    
    NSDictionary *dc1 = [[NSDictionary alloc]initWithDictionary:dic1];
    NSDictionary *dc2 = [[NSDictionary alloc]initWithDictionary:dic2];
    NSDictionary *dc3 = [[NSDictionary alloc]initWithDictionary:dic3];
    NSDictionary *dc4 = [[NSDictionary alloc]initWithDictionary:dic4];
    NSDictionary *dc5 = [[NSDictionary alloc]initWithDictionary:dic5];
    NSDictionary *dc6 = [[NSDictionary alloc]initWithDictionary:dic6];
    NSDictionary *dc7 = [[NSDictionary alloc]initWithDictionary:dic7];
        
    item = [[NSMutableArray alloc]initWithObjects:dc1,dc2,dc3,dc4,dc5,dc6,dc7, nil]; 
    
    NSArray *array1 = [[NSArray alloc]initWithArray:item];
    [def setObject:array1 forKey:@"PRODUCT"];
    [def synchronize];
    
}

- (void)removeArray{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSMutableArray *item = [def objectForKey:@"PRODUCT"]; 
    NSMutableArray *item1 = [[NSMutableArray alloc]initWithArray:item];
    int count = [item1 count];
    for(int i=count-1; i>-1;i--){
        if([[[item1 objectAtIndex:i]objectForKey:@"ITEM"] count] == 0){
            [item1 removeObjectAtIndex:i];        
        }
    }
    
    NSArray *array1 = [[NSArray alloc]initWithArray:item1];
    [def setObject:array1 forKey:@"PRODUCT"];
    [def synchronize];
    
}

- (id)initWithCoder:(NSCoder *)coder {
    
	self.product_id = [coder decodeObjectForKey:@"product_id"];
    self.price02_min = [coder decodeObjectForKey:@"price02_min"];
    self.stock = [coder decodeObjectForKey:@"stock"];
    self.time_limit = [coder decodeObjectForKey:@"time_limit"];
    self.material = [coder decodeObjectForKey:@"material"];
    self.allergy = [coder decodeObjectForKey:@"allergy"];
    self.name = [coder decodeObjectForKey:@"name"];
    self.main_comment = [coder decodeObjectForKey:@"main_comment"];
    self.main_image = [coder decodeObjectForKey:@"main_image"];
    self.sub_image1 = [coder decodeObjectForKey:@"sub_image1"];
    self.sub_image2 = [coder decodeObjectForKey:@"sub_image2"];
    self.categories = [coder decodeObjectForKey:@"categories"];
    self.category = [coder decodeObjectForKey:@"category"];
    self.main_list_comment = [coder decodeObjectForKey:@"main_list_comment"];
    self.create = [coder decodeObjectForKey:@"create"];
    self.update = [coder decodeObjectForKey:@"update"];
    self.mainIMG = [coder decodeObjectForKey:@"mainIMG"];
    self.subIMG1 = [coder decodeObjectForKey:@"subIMG1"];
    self.subIMG2 = [coder decodeObjectForKey:@"subIMG2"];
    
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:self.product_id forKey:@"product_id"];
    [encoder encodeObject:self.price02_min forKey:@"price02_min"];
    [encoder encodeObject:self.stock forKey:@"stock"];
    [encoder encodeObject:self.time_limit forKey:@"time_limit"];
    [encoder encodeObject:self.material forKey:@"material"];
    [encoder encodeObject:self.allergy forKey:@"allergy"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.main_comment forKey:@"main_comment"];
    [encoder encodeObject:self.main_image forKey:@"main_image"];
    [encoder encodeObject:self.sub_image1 forKey:@"sub_image1"];
    [encoder encodeObject:self.sub_image2 forKey:@"sub_image2"];
    [encoder encodeObject:self.categories forKey:@"categories"];
    [encoder encodeObject:self.category forKey:@"category"];
    [encoder encodeObject:self.main_list_comment forKey:@"main_list_comment"];
    [encoder encodeObject:self.create forKey:@"create"];
    [encoder encodeObject:self.update forKey:@"update"];
    [encoder encodeObject:self.mainIMG forKey:@"mainIMG"];
    [encoder encodeObject:self.subIMG1 forKey:@"subIMG1"];
    [encoder encodeObject:self.subIMG2 forKey:@"subIMG2"];
}


@end
