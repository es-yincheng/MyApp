//
//  NetWorking.h
//  IBZApp
//
//  Created by yc on 16/5/25.
//  Copyright © 2016年 ibaozhuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworkReachabilityManager.h"

typedef void(^ProgressBlock)(NSProgress * _Nonnull uploadProgress);
typedef void(^SuccessBlock)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject);
typedef void(^FailureBlock)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error);


typedef NS_ENUM(NSInteger, NetworkStatus) {
    NetworkStatusUnknown          = -1,
    NetworkStatusNotReachable     = 0,
    NetworkStatusReachableViaWWAN = 1,
    NetworkStatusReachableViaWiFi = 2,
};

@interface NetWorking : NSObject

@property (nonatomic, assign) NetworkStatus status;

@property (nonatomic, strong) ProgressBlock _Nonnull progress;
@property (nonatomic, copy) SuccessBlock _Nonnull success;
@property (nonatomic, copy) FailureBlock _Nonnull failure;

+ (NetWorking *_Nonnull)sharedNetWorking;
+ (NetworkStatus)getNetWorkStatuCode;
+ (NSString *_Nonnull)getNetWorkStatuString;
+ (void)startMonitoring;

-(void)get:(NSString *)urlString
parameters:(NSDictionary *)parameters
  progress:(ProgressBlock)uploadProgress
   success:(SuccessBlock)success
   failure:(FailureBlock)failure;

-(void)post:(NSString *)method
 parameters:(NSDictionary *)parameters
   progress:(ProgressBlock)uploadProgress
    success:(SuccessBlock)success
    failure:(FailureBlock)failure;

@end
