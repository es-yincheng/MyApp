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

@end

@implementation BaisiModel

+ (NSInteger)yc_getLastIndex:(id)keyValues{
    NSInteger index = 0;
    if ([[keyValues yc_objectForKey:@"info"] yc_objectForKey:@"np"]) {
        return [[[keyValues yc_objectForKey:@"info"] yc_objectForKey:@"np"] integerValue];
    }
    return index;
}

+ (NSMutableArray *)yc_objectWithKeyValues:(id)keyValues{
    
    if ([NSNull null] == [keyValues yc_objectForKey:@"list"] ||
        ![keyValues yc_objectForKey:@"list"]) {
        [MBProgressHUD showMessageAuto:[NSString stringWithFormat:@"%@",[keyValues yc_objectForKey:@"ErrorMsg"]]];
        return nil;
    }
    
    NSArray *baisi = [keyValues yc_objectForKey:@"list"];
    
    return [self getParamesFrom:baisi];
}

+ (NSMutableArray *)getParamesFrom:(NSArray *)array{
    NSMutableArray *baisiModels = [NSMutableArray arrayWithCapacity:array.count];
    
    for (NSDictionary *dict in array) {
        BaisiModel *model = [[BaisiModel alloc] init];
        
//        @property (nonatomic, copy) NSString *bofangCount;
//        @property (nonatomic, copy) NSString *bofangTime;

        model.userIcon = [[[dict yc_objectForKey:@"u"] yc_objectForKey:@"header"] yc_objectAtIndex:0];
        model.userName = [[dict yc_objectForKey:@"u"] yc_objectForKey:@"name"];
        model.publishTime = [dict yc_objectForKey:@"passtime"];
        model.baisiType = [dict yc_objectForKey:@"type"];
        model.baisiText = [dict yc_objectForKey:@"text"];
        model.baisiShareUrl = [dict yc_objectForKey:@"share_url"];
        model.zanCount = [NSString stringWithFormat:@" %@",[dict yc_objectForKey:@"up"]];
        model.caiCount = [NSString stringWithFormat:@" %@",[dict yc_objectForKey:@"down"]];
        model.shareCount = [NSString stringWithFormat:@" %@",[dict yc_objectForKey:@"forward"]];
        model.commentCount = [NSString stringWithFormat:@" %@",[dict yc_objectForKey:@"comment"]];
        
        if ([dict yc_objectForKey:@"top_comments"]) {
            NSMutableAttributedString *tempString = [[NSMutableAttributedString alloc] init];
            NSString *commentUser = [NSString stringWithFormat:@"%@ :",[[[[dict yc_objectForKey:@"top_comments"] yc_objectAtIndex:0] yc_objectForKey:@"u"] yc_objectForKey:@"name"]];
            NSDictionary *dictAttr0 = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor colorWithRed:0.400 green:0.800 blue:1.000 alpha:1.000]};
            NSAttributedString *attr0 = [[NSAttributedString alloc] initWithString:commentUser attributes:dictAttr0];
            
            NSString *commentStr = [[[dict yc_objectForKey:@"top_comments"] yc_objectAtIndex:0] yc_objectForKey:@"content"];
            NSDictionary *dictAttr1 = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor lightGrayColor]};
            NSAttributedString *attr1 = [[NSAttributedString alloc] initWithString:commentStr attributes:dictAttr1];
            [tempString appendAttributedString:attr0];
            [tempString appendAttributedString:attr1];
            model.commentText = tempString;
        }
    
        NSString *tag = @"";
        for (NSDictionary *tagDict in [dict yc_objectForKey:@"tags"]) {
            tag = [NSString stringWithFormat:@"%@  %@",tag,[tagDict yc_objectForKey:@"name"]];
        }
        model.baisiTags = tag;
        
        if ([model.baisiType isEqualToString:@"image"]) {
            model.baisiImageSmal = [[[dict yc_objectForKey:model.baisiType] yc_objectForKey:@"medium"] yc_objectAtIndex:0];
            model.baisiImageBig = [[[dict yc_objectForKey:model.baisiType] yc_objectForKey:@"big"] yc_objectAtIndex:0];
            model.imageWidth = [[[dict yc_objectForKey:model.baisiType] yc_objectForKey:@"width"] floatValue];
            model.imageHeight = [[[dict yc_objectForKey:model.baisiType] yc_objectForKey:@"height"] floatValue];
        } else if ([model.baisiType isEqualToString:@"gif"]) {
            model.baisiImageSmal = [[[dict yc_objectForKey:model.baisiType] yc_objectForKey:@"images"] yc_objectAtIndex:0];
            model.baisiImageBig = [[[dict yc_objectForKey:model.baisiType] yc_objectForKey:@"images"] yc_objectAtIndex:0];
            model.imageWidth = [[[dict yc_objectForKey:model.baisiType] yc_objectForKey:@"width"] floatValue];
            model.imageHeight = [[[dict yc_objectForKey:model.baisiType] yc_objectForKey:@"height"] floatValue];
        } else if ([model.baisiType isEqualToString:@"video"]) {
            
        }
        
        [baisiModels addObject:model];
    }
    
    return baisiModels;
}

@end
