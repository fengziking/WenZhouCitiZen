//
//  CJUserDataModel.h
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/10.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import <Foundation/Foundation.h>

/****存储用户基本信息*****/

@interface CJUserDataModel : NSObject<NSCoding>

//登录之后服务器返回的数据
@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *CartID;
@property(nonatomic,copy)NSString *token;
@property(nonatomic,copy)NSString *oldPwd;
@property(nonatomic,copy)NSString *sysSign;
@property(nonatomic,assign)BOOL isLogIn;

/**
 * 初始化创建
 */
- (instancetype)initWithDict:(NSDictionary *)dict;

/**
 * 类方法创建
 */
+ (instancetype)userModelWithDict:(NSDictionary *)dict;

/**
 * 防止上述两种方法创建时候 传入的 dict 有包含非本类属性的关键值字段
 */
-(void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end
