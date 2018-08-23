//
//  CJDataManager.m
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/10.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import "CJDataManager.h"
#import <objc/runtime.h>

#define kCJUserInfoCacheName @"CJUserInfoCacheName"
#define kCJUserInfo @"userInfo"

@interface CJDataManager (){
    
    YYCache *cache;
}

@end
@implementation CJDataManager

+(instancetype)shareInstance {
    static CJDataManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CJDataManager alloc] init];
    });
    return instance;
}

- (NSString *)token {
//  方案1
    return [NSString isNull:[self cacheDataModel].token] ? @"" : [self cacheDataModel].token;
//    方案2
//    return  CJUserDefaultsGetObj(kToken);
}
- (NSString *)userId {
    return [NSString isNull:[self cacheDataModel].userId] ? @"" : [self cacheDataModel].userId;
}
-(NSString *)CartID {
    return [NSString isNull:[self cacheDataModel].CartID] ? @"" : [self cacheDataModel].CartID;
}
- (NSString *)oldPwd {
    return [NSString isNull:[self cacheDataModel].oldPwd] ? @"" : [self cacheDataModel].token;
}
- (NSString *)sysSign {
    return [NSString isNull:[self cacheDataModel].sysSign] ? @"" : [self cacheDataModel].sysSign;
}

//判断是否登录状态
- (BOOL)isLogIn {
    //方案一
//    BOOL isLogin = [self cachDataModel].isLogIn;
//    KNSLog(@"cache缓存是否登录:%@",@(isLogin));
//    KNSLog(@"%@",[self cachDataModel]);
    //方案二
    return [CJUserDefaults boolForKey:kIsLogIn];
}

- (CJUserDataModel *)cacheDataModel {
    cache = [YYCache cacheWithName:kCJUserInfoCacheName];
    CJUserDataModel *cashModel = (CJUserDataModel *)[cache objectForKey:kCJUserInfo];
    return cashModel;
}

/**********登录之后的操作***********/
- (void)loginSucceedWithModel:(CJUserDataModel *)userModel {
    
    //YYCache （方案一）
     cache = [YYCache cacheWithName:kCJUserInfoCacheName];
    [cache setObject:userModel forKey:kCJUserInfo withBlock:nil];
    
    //偏好设置 （方案二）
//     CJUserDefaultsSetObj(userModel.CartID, kCartID);
//     CJUserDefaultsSetObj(userModel.token, kToken);
//     CJUserDefaultsSetObj(userModel.userId,kUserId);
//     CJUserDefaultsSetObj(userModel.oldPwd, kOldPwd);
//     CJUserDefaultsSetObj(userModel.sysSign, kSysSign);
     [CJUserDefaults setBool:YES forKey:kIsLogIn];
     CJUserDefaultsSynchronize;
}

/****退出登录之后***********/

- (void)logOutSuccessBlock:(void (^)(void))success fail:(void(^)(void))fail {

    //清空数据库 操作
    [[YYCache cacheWithName:kCJUserInfoCacheName] removeAllObjects];
    
//    [self removeCachePath];
    
    NSDictionary *dic = [CJUserDefaults dictionaryRepresentation];
    for (id  key in dic) {
        if (!([key isEqualToString:kCJVersionKey])) {

            CJUserDefaultsClearObj(key);
        }
    }
    CJUserDefaultsSynchronize;
    
    //默认退出成功
    if (success) {
        success();
    }
}

/**
 *   移除文件夹 （可选操作）
 *
 */
- (void)removeCachePath {
    NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
    for (NSString *p in files) {
        NSError *error;
        NSString *path = [cachPath stringByAppendingPathComponent:p];
        if ([path containsString:kCJUserInfoCacheName] && [[NSFileManager defaultManager] fileExistsAtPath:path]) {
            [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
        }
        
    }
}


@end
