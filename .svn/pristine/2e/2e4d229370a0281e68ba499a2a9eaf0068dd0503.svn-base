//
//  Common_UserDefault.h
//  JinHuaCitizen
//
//  Created by Frank-Lee on 17/8/29.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#ifndef Common_UserDefault_h
#define Common_UserDefault_h
//沙盒中记录的版本号
static NSString *const kCJVersionKey = @"curVersion";
//登录状态
static NSString *const kIsLogIn = @"isLogIn";
static NSString *const kCartID = @"CartID";
static NSString *const kUserId = @"userId";
static NSString *const kToken  = @"token";
static NSString *const kOldPwd = @"oldPwd";
static NSString *const kSysSign = @"sysSign";
/**是否登录状态 */
#define WZ_IsLoinState [CJUserDefaults boolForKey:kIsLogIn]
/**版本号 */
#define KcurVersion   CJUserDefaultsDecEncryptGetObj(kCJVersionKey)






/************************数据库 沙盒******************************/
#pragma mark -- 可公用便捷读写NSUserDefaults
//创建
#define CJUserDefaults [NSUserDefaults standardUserDefaults]
//存储
#define CJUserDefaultsSetObj(obj,key) {if (obj) {[CJUserDefaults setObject:obj forKey:key];}}
//获取
#define CJUserDefaultsGetObj(key) [CJUserDefaults objectForKey:key]
//存储bool
#define CJUserDefaultsSetBool(bool,key) [CJUserDefaults setBool:bool forKey:key]
//获取bool
#define CJUserDefaultsGetBool(key) [CJUserDefaults boolForKey:key]
//同步
#define CJUserDefaultsSynchronize [CJUserDefaults synchronize]
//移除
#define CJUserDefaultsClearObj(key) [CJUserDefaults removeObjectForKey:key]

#define K3DES  [FqRSA encryptString:@"qbyFhMTpHg4m4DrS6xFIw9Vw" publicKey:FqPubkey]

#endif /* Common_UserDefault_h */
