//
//  ProductUserDefaults.h
//  cheese
//
//  Created by 酒井 邦也 on 12/06/19.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "ProductClass.h"

@interface ProductUserDefaults : ProductClass<NSCoding>{
    
    NSData *_mainIMG;
    NSData *_subIMG1;
    NSData *_subIMG2;
    
    NSMutableArray *arr1;
    NSMutableArray *arr2;
    NSMutableArray *arr3;
    NSMutableArray *arr4;
    NSMutableArray *arr5;
    NSMutableArray *arr6;
    NSMutableArray *arr7;
    
    NSMutableDictionary *dic1;
    NSMutableDictionary *dic2;
    NSMutableDictionary *dic3;
    NSMutableDictionary *dic4;
    NSMutableDictionary *dic5;
    NSMutableDictionary *dic6;
    NSMutableDictionary *dic7;
    
}
@property(copy,nonatomic)NSData *mainIMG;
@property(copy,nonatomic)NSData *subIMG1;
@property(copy,nonatomic)NSData *subIMG2;

- (id)initWithObj:(NSDictionary *)pdt;
- (void)userDefaults:(ProductUserDefaults *)pud;
- (void)removeArray;

@end
