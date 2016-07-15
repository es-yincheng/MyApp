//
//  BaisiModel.h
//  MyApp
//
//  Created by 尹成 on 16/7/15.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "BaseModel.h"
#import "TagsModel.h"
#import "UserModel.h"
#import "ImageModel.h"

@interface BaisiModel : BaseModel

/**
 *  评论
 */
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *bookmark;
@property (nonatomic, copy) NSString *up;
@property (nonatomic, copy) NSString *down;
@property (nonatomic, copy) NSString *forward;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *share_url;
@property (nonatomic, copy) NSString *type;

//@property (nonatomic, copy) NSString *authorName;
//@property (nonatomic, copy) NSString *authorImage;
@property (nonatomic, strong) UserModel *u;
@property (nonatomic, copy) NSString *passtime;

@property (nonatomic, copy) NSString *zanName;
@property (nonatomic, copy) NSString *zanImage;
@property (nonatomic, copy) NSString *zanText;

@property (nonatomic, strong) ImageModel *imageModel;

@property (nonatomic, copy) NSString *small;
@property (nonatomic, copy) NSString *medium;
@property (nonatomic, copy) NSString *big;
@property (nonatomic, copy) NSString *download_url;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger width;

@property (nonatomic, strong) NSArray *tags;

@end
