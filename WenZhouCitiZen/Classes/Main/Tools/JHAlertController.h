//
//  JHAlertController.h
//  JinHuaCitizen
//
//  Created by Frank-Lee on 17/8/11.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  回调block
 */
//typedef void (^cancelBlock)(id);
//typedef void (^sureBlock)(id);

@interface JHAlertController : NSObject


//该功能正在开发中.....
+(void)showWarmTipsWithVC:(UIViewController *)VC ;



+ (void)showAlertWith:(UIViewController *)VC title:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancel sureTitle:(NSString *)sure cancelBlock:(void(^)(id cancelBlock))cancelBlo sure:(void(^)(id sureBlock))sureBlo;


+(void)isRealNameVC:(UIViewController *)VC withNav:(id)Nav WithBlock:(void(^)(id blo))finish ;


@end
