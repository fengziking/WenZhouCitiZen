//
//  CJDataManager.h
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/10.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJUserDataModel.h"

//数据库管理类
#define kCJBasicDataManager [CJDataManager shareInstance]

@interface CJDataManager : NSObject

+(instancetype)shareInstance;

//读取的信息
@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *CartID;
@property(nonatomic,copy)NSString *token;
@property(nonatomic,copy)NSString *oldPwd;
@property(nonatomic,copy)NSString *sysSign;
@property(nonatomic,assign)BOOL isLogIn;

/****登录之后的操作*****/
- (void)loginSucceedWithModel:(CJUserDataModel *)userModel;

/****退出登录之后***********/
//如果以后有数据请求 则回调成功和失败
- (void)logOutSuccessBlock:(void (^)(void))success fail:(void(^)(void))fail;




@end
