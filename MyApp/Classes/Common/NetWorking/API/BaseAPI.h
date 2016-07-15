//
//  BaseAPI.h
//  IBZApp
//
//  Created by yc on 16/5/20.
//  Copyright © 2016年 ibaozhuang. All rights reserved.
//


#import "BaisiService.h"
//#import "UserService.h"
//#import "OrderService.h"
//#import "CompanyService.h"

@interface BaseAPI : NSObject

@property (strong, nonatomic) BaisiService *baisiService;

//@property (strong, nonatomic) UserService    *userService;
//@property (strong, nonatomic) OrderService   *orderService;
//@property (strong, nonatomic) CompanyService *companyService;

+ (BaseAPI *)sharedAPI;
@end
