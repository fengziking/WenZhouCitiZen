//
//  Common_Define.h
//  JinHuaCitizen
//
//  Created by Frank-Lee on 17/8/3.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#ifndef Common_Define_h
#define Common_Define_h


/***第三方***/
#import <MBProgressHUD/MBProgressHUD.h>
#import <Masonry/Masonry.h>
#import "PPNetworkHelper.h"
#import <AFNetworking/AFNetworking.h>
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "MBProgressHUD+BWMExtension.h"
#import "FCUUID.h"
#import "YYCache.h"
/**转模型*/
#import <MJExtension/MJExtension.h>

/**SDimage*/
#import <SDWebImage/UIImageView+WebCache.h>

/**刷新 */
#import <MJRefresh/MJRefresh.h>

/**键盘处理 */
#import <IQKeyboardManager/IQKeyboardManager.h>



/************************  分类   ****************/
#import "UINavigationController+FDFullscreenPopGesture.h"
//  处理数组越界
#import "NSArray+cate.h"
//控件分类
#import "UIButton+Block.h"
#import "UIButton+EnlargeEdge.h"
#import "UIButton+LZCategory.h"
#import "UIButton+ImgTitleLayout.h"
#import "UIButton+Indicator.h"
#import "UIButton+Submitting.h"
#import "UIButton+Easy.h"

#import "UILabel+Easy.h"

#import "UIView+Frame.h"
#import "UIViewController+Dealloc.h"
#import "UIView+viewController.h"
#import "UIView+BlockGesture.h"
//
#import "NSString+MD5.h"
#import "NSString+Size.h"
#import "NSString+RegexCategory.h"

#import "NSDictionary+encoding.h"

#import "UIAlertController+Blocks.h"
#import "JHAlertController.h"

#import "CJLogTextFiled.h"
#import "NSDate+Extension.h"

//3des加密
#import "FqRSA.h"
#import "DES3.h"
///tool
#import "HttpTool.h"
#import "CJTool.h"
#import "NoListView.h"
#import "JHBtnListView.h"

#import "CJBaseViewController.h"
#import "CJDataManager.h"
#import "CJNetWorkManager.h"

/***********调测输出****************/

#ifdef DEBUG

//调试阶段
#define KNSLog(fmt, ...) printf("< Line:(%d) > method: %s \n%s\n", __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(fmt), ##__VA_ARGS__] UTF8String] )
#define KUPpayMode @"01"
#else
//发布阶段
#define KNSLog(...)
#define KUPpayMode @"00"
#endif


//快速定义 weakSelf   使用 WS(weakSelf)； 直接使用WeakSelf
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
//防止循环引用
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif


// Iphone X 适配
#define kSystermVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#ifdef kiOS11Before
#define kiOS11Before (kSystermVersion < 11)
#endif

#define CJ_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define  CJ_StatusBarHeight      (CJ_iPhoneX ? 44.f : 20.f)

#define  CJ_NavigationBarHeight  44.f

#define  CJ_TabbarHeight         (CJ_iPhoneX ? (49.f+34.f) : 49.f)

#define  CJ_TabbarSafeBottomMargin         (CJ_iPhoneX ? 34.f : 0.f)

#define  CJ_StatusBarAndNavigationBarHeight  (CJ_iPhoneX ? 88.f : 64.f)

#define CJ_ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})




#endif /* Common_Define_h */
