//
//  ImageModel.h
//  MyApp
//
//  Created by 尹成 on 16/7/15.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "BaseModel.h"

@interface ImageModel : BaseModel

@property (nonatomic, strong) NSArray *small;
@property (nonatomic, strong) NSArray *medium;
@property (nonatomic, strong) NSArray *big;
@property (nonatomic, strong) NSArray *download_url;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger width;

@end
