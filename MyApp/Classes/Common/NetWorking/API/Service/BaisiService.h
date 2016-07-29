//
//  BaisiService.h
//  MyApp
//
//  Created by 尹成 on 16/7/15.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "BaseService.h"

@interface BaisiService : BaseService

- (void)getItemsFrom:(NSInteger)startIndex
                  to:(NSNumber *)endIndex
             success:(SuccessBlock)success
             failure:(FailureBlock)failure;

@end
