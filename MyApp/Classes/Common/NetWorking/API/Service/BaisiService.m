//
//  BaisiService.m
//  MyApp
//
//  Created by 尹成 on 16/7/15.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "BaisiService.h"
#import "NetWorking.h"

@implementation BaisiService

- (void)getItemsFrom:(NSInteger)startIndex
                  to:(NSNumber *)endIndex
             success:(SuccessBlock)success
             failure:(FailureBlock)failure{
    NSLog(@"url:%@",[NSString stringWithFormat:@"http://s.budejie.com/topic/list/jingxuan/10/baisi_xiaohao-iphone-4.1/%ld-20.json",(long)startIndex]);
    [[NetWorking sharedNetWorking] get:[NSString stringWithFormat:@"http://s.budejie.com/topic/list/jingxuan/10/baisi_xiaohao-iphone-4.1/%ld-20.json",(long)startIndex]
                            parameters:nil
                              progress:nil
                               success:success
                               failure:failure];
    
}

@end
