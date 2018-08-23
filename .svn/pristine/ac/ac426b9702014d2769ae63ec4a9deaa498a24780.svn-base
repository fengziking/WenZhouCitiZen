//
//  JHAlertController.m
//  JinHuaCitizen
//
//  Created by Frank-Lee on 17/8/11.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#import "JHAlertController.h"

/**
 *  检测系统版本
 */
#define iOS_Version [[[UIDevice currentDevice] systemVersion] floatValue]

/**
 *  弹框显示的时间，默认1秒
 */
#define AlertViewShowTime 1.0


@implementation JHAlertController


+(void)showWarmTipsWithVC:(UIViewController *)VC {
//    __weak typeof(self)weakSelf = self;
    
    
    if (iOS_Version >= 8.0) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"功能即将上线，敬请期待" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            
        }];
        [alert addAction:sure];
        [VC presentViewController:alert animated:YES completion:nil];
    }else {
        
    }
}



+(void)showAlertWith:(UIViewController *)VC title:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancel sureTitle:(NSString *)sure cancelBlock:(void(^)(id cancelBlock))cancelBlo sure:(void(^)(id sureBlock))sureBlo {
    
    __weak typeof(self)weakSelf = self;
    
    if (iOS_Version >= 8.0) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        //添加按钮
        if (cancelBlo && cancel ) {
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                cancelBlo(weakSelf) ;
                
            }];
            [alert addAction:cancelAction];
        }
        
        if (sureBlo && sure) {
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sure style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                sureBlo(weakSelf) ;
                
            }];
            [alert addAction:sureAction];
        }
        
        [VC presentViewController:alert animated:YES completion:nil];
        
        //如果没有按钮，自动延迟消失
        if (cancel == nil && sure == nil) {
            //此时self指本类
            [self performSelector:@selector(dismissAlertController:) withObject:alert afterDelay:AlertViewShowTime];
        }
    }else {
        
        
    }
}
+ (void)dismissAlertController:(UIAlertController *)alert
{
    [alert dismissViewControllerAnimated:YES completion:nil];
}


+(void)isRealNameVC:(UIViewController *)VC withNav:(id)Nav WithBlock:(void(^)(id blo))finish {
    [JHAlertController showAlertWith:VC title:@"温馨提示" message:@"您尚未设置交易密码，是否去设置" cancelTitle:@"取消" sureTitle:@"确定" cancelBlock:^(id cancelBlock) {
        
    } sure:^(id sureBlock) {
       
    }];

}


@end
