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

- (void)getItemsFrom:(NSNumber *)startIndex
                  to:(NSNumber *)endIndex
             success:(SuccessBlock)success
             failure:(FailureBlock)failure{
    
    
    [[NetWorking sharedNetWorking] get:@"http://s.budejie.com/topic/list/jingxuan/10/baisi_xiaohao-iphone-4.1/0-20.json"
                            parameters:nil
                              progress:nil
                               success:success
                               failure:failure];
    
}

@end
