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

@property (nonatomic, copy) NSString *userIcon;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *publishTime;
@property (nonatomic, copy) NSString *baisiType;
@property (nonatomic, copy) NSString *baisiText;
/**
 *  多媒体图片（根据类型可能是 图片，gif，video）
 */
@property (nonatomic, copy) NSString *baisiImageSmal;
@property (nonatomic, copy) NSString *baisiImageBig;
@property (nonatomic, assign) CGFloat imageHeight;
@property (nonatomic, assign) CGFloat imageWidth;
/**
 *  多媒体下载地址
 */
@property (nonatomic, copy) NSString *baisiUrl;

/**
 *  播放次数，只有视频类型有
 */
@property (nonatomic, copy) NSString *bofangCount;
/**
 *  评论：蓝色评论人name 和 评论内容
 */
@property (nonatomic, copy) NSAttributedString *commentText;
/**
 *  视频时长，只有视频类型有
 */
@property (nonatomic, copy) NSString *bofangTime;
@property (nonatomic, copy) NSString *baisiTags;
@property (nonatomic, copy) NSString *zanCount;
@property (nonatomic, copy) NSString *caiCount;
@property (nonatomic, copy) NSString *shareCount;
@property (nonatomic, copy) NSString *commentCount;

@property (nonatomic, copy) NSString *baisiShareUrl;

+ (NSInteger)yc_getLastIndex:(id)keyValues;

@end
