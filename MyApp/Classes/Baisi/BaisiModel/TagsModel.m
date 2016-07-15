//
//  TagesModel.m
//  MyApp
//
//  Created by 尹成 on 16/7/15.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "TagsModel.h"
#import "MJExtension.h"

@implementation TagsModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"tagId":@"id"
             };
}

@end
