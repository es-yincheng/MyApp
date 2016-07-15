//
//  BaisiModel.m
//  MyApp
//
//  Created by 尹成 on 16/7/15.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "BaisiModel.h"
#import "MJExtension.h"

@interface BaisiModel()

@property (nonatomic, strong) NSDictionary *image;
@property (nonatomic, strong) NSDictionary *video;
@property (nonatomic, strong) NSDictionary *gif;

@end

@implementation BaisiModel

+ (NSMutableArray *)yc_objectWithKeyValues:(id)keyValues{
    
    if ([NSNull null] == [keyValues yc_objectForKey:@"list"] ||
        ![keyValues yc_objectForKey:@"list"]) {
        //        [MBProgressHUD showMessageAuto:[NSString stringWithFormat:@"%@",[keyValues yc_objectForKey:@"ErrorMsg"]]];
        return nil;
    }
    
    NSArray *baisi = [keyValues yc_objectForKey:@"list"];
    return [self mj_objectArrayWithKeyValuesArray:baisi context:nil];
    
}

//+ (NSDictionary *)mj_replacedKeyFromPropertyName{
//    return @{
//             @"imageModel":@"image"
//             };
//}

//
//+ (NSDictionary *)mj_replacedKeyFromPropertyName{
//    return @{
//             @"small":@"image.small",
//             @"medium":@"image.medium",
//             @"big":@"image.big",
//             @"download_url":@"image.download_url",
//             @"height":@"image.height",
//             @"width":@"image.width"
//             };
//}


- (NSString *)small{
    
    if ([self.type isEqualToString:@"gif"]) {
        return [[self.gif yc_objectForKey:@"images"] yc_objectAtIndex:0];
    }
    if ([self.type isEqualToString:@"video"]) {
        return [[self.video yc_objectForKey:@"video"] yc_objectAtIndex:0];
    }
    if ([self.type isEqualToString:@"image"]) {
        return [[self.image yc_objectForKey:@"medium"] yc_objectAtIndex:0];
    }
    return nil;
}

- (NSString *)medium{
//    return [[self.image yc_objectForKey:@"medium"] yc_objectAtIndex:0];
    if ([self.type isEqualToString:@"gif"]) {
        return [[self.gif yc_objectForKey:@"images"] yc_objectAtIndex:0];
    }
    if ([self.type isEqualToString:@"video"]) {
        return [[self.video yc_objectForKey:@"video"] yc_objectAtIndex:0];
    }
    if ([self.type isEqualToString:@"image"]) {
        return [[self.image yc_objectForKey:@"medium"] yc_objectAtIndex:0];
    }
    return nil;
}

- (NSString *)big{
//    return [[self.image yc_objectForKey:@"big"] yc_objectAtIndex:0];
    if ([self.type isEqualToString:@"gif"]) {
        return [[self.gif yc_objectForKey:@"images"] yc_objectAtIndex:0];
    }
    if ([self.type isEqualToString:@"video"]) {
        return [[self.video yc_objectForKey:@"video"] yc_objectAtIndex:0];
    }
    if ([self.type isEqualToString:@"image"]) {
        return [[self.image yc_objectForKey:@"medium"] yc_objectAtIndex:0];
    }
    return nil;
}

- (NSString *)download_url{
//    return [[self.image yc_objectForKey:@"download_url"] yc_objectAtIndex:0];
    if ([self.type isEqualToString:@"gif"]) {
        return [[self.gif yc_objectForKey:@"images"] yc_objectAtIndex:0];
    }
    if ([self.type isEqualToString:@"video"]) {
        return [[self.video yc_objectForKey:@"video"] yc_objectAtIndex:0];
    }
    if ([self.type isEqualToString:@"image"]) {
        return [[self.image yc_objectForKey:@"medium"] yc_objectAtIndex:0];
    }
    return nil;
}

- (NSInteger)height{
    
    if ([self.type isEqualToString:@"gif"]) {
        return [[self.gif yc_objectForKey:@"height"] integerValue];
    }
    if ([self.type isEqualToString:@"video"]) {
        return [[self.video yc_objectForKey:@"height"] integerValue];
    }
    if ([self.type isEqualToString:@"image"]) {
        return [[self.image yc_objectForKey:@"height"] integerValue];
    }
    return 1;
}

- (NSInteger)width{
    
    if ([self.type isEqualToString:@"gif"]) {
        return [[self.gif yc_objectForKey:@"width"] integerValue];
    }
    if ([self.type isEqualToString:@"video"]) {
        return [[self.video yc_objectForKey:@"width"] integerValue];
    }
    if ([self.type isEqualToString:@"image"]) {
        return [[self.image yc_objectForKey:@"width"] integerValue];
    }
    return 1;
}

@end
