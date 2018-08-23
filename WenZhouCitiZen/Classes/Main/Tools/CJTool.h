//
//  CJTool.h
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/10.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJTool : NSObject

+ (instancetype)shareInstance;

+ (NSString *)generateTradeNO;
//分转化为元
+ (NSString *)changeformatterWithFen:(NSString *)money;
//判断字符串
+ (NSString *)handleStringCheckNull:(NSString *)string;

//限制输入
+(BOOL)PWvalidateNumber:(NSString*)number;

// 判断密码
+ (BOOL) validatePassword:(NSString *)passWord;

//*手机号码验证
+(BOOL)isValidateMobile:(NSString *)mobile;




/**************新增*****************/
#pragma mark --
/**
 * 当需要改变Label中的多段字体属性时调用
 */
+ (NSMutableAttributedString *)getColorsInLabel:(NSString *)allstring ColorString:(NSArray *)colorStringArray Colors:(NSArray *)colorArr fontSize:(CGFloat)size;
#pragma mark --
/**
 * 当需要改变Label中得一段字体属性时调用
 */
+ (NSMutableAttributedString *)getOneColorInLabel:(NSString *)allstring ColorString:(NSString *)string Color:(UIColor*)color fontSize:(float)size;

/*
 *  给控件增加四边圆角
 *  view.layer.mask = [Tool getCAShapeLayerCornerRadiusRect:view.bounds withRadius:15];
 */
+ (CAShapeLayer *)getCAShapeLayerCornerRadiusRect:(CGRect)rect withRadius:(CGFloat)radius;
/**
 *  给控件增加两边个圆角 使用同上
 */
+ (CAShapeLayer *)getCornersWithRect:(CGRect)rect withUIRectCorner0:(UIRectCorner)UIRectCorner0 withUIRectCorner1:(UIRectCorner)UIRectCorner1 withRadius:(CGFloat)radius;

/**
 * 求文本size 或者 高度
 */
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;

+ (CGFloat)heightWithString:(NSString *)string font:(UIFont *)font constrainedToWidth:(CGFloat)width;

//获得设备类型
+ (NSString *)getIphoneType;

//是否越狱
+ (BOOL)isJailbroken;

//画线
+ (UIView *)getLineView:(CGRect)frame color:(UIColor*)color;



//检测后台数据为空，
+ (NSString *)getNullContent:(id)content backStr:(NSString *)backStr;

//替换文字加星星
+ (NSString *)getStarStr:(NSString *)allStr range:(NSRange )range;


//获得cell的arrow
+ (UIImageView *)getArrowImgCellHeight:(CGFloat)height bgWidth:(CGFloat)width rightSpace:(CGFloat)space ;

/**
 * 图片压缩
 */
+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
/**
获取顶部控制器
 */
+(UIViewController*)getCurrentVC;

/**
 判断空值
 */
+ (BOOL)isBlankString:(NSString *)string;
@end
