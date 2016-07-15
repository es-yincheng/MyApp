//
//  UserModel.h
//  MyApp
//
//  Created by 尹成 on 16/7/15.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "BaseModel.h"

@interface UserModel : BaseModel

@property (nonatomic, copy  ) NSString  *uid;
@property (nonatomic, copy  ) NSString  *name;
@property (nonatomic, assign) NSInteger is_vip;
@property (nonatomic, strong) NSArray   *header;

@end
