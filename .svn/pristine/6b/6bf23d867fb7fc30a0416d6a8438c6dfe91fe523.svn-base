//
//  CJUserDataModel.m
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/10.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import "CJUserDataModel.h"

@implementation CJUserDataModel

#pragma mark -- 归档和解档(存储二进制文件必须的操作)
/*********归档和解档************/
- (void)encodeWithCoder:(NSCoder *)aCoder {

    [aCoder encodeBool:self.isLogIn forKey:kIsLogIn];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  
    self.isLogIn = [aDecoder decodeBoolForKey:kIsLogIn];
    return self;
}

#pragma mark -- 初始化
/*****初始化******/
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)userModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

#pragma mark -- 预防
//如果dict传入的属性名不同于model中的名字 可以 在该方法里做判断
/*
    if([key isEqualToString:@"id"])
    {
        self.userId = value;
    }
*/
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end
