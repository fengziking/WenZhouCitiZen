//
//  CJTool.m
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/10.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import "CJTool.h"
#import <sys/utsname.h>
@implementation CJTool

+ (instancetype)shareInstance {
    static CJTool *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


+ (NSString *)changeformatterWithFen:(NSString *)money
{
    NSString *yuanString = nil;
    NSInteger moneyInt = ((NSNumber *)money).integerValue;
    if (moneyInt % 100 == 0) {
        yuanString = [NSString stringWithFormat:@"%ld",moneyInt/100];
        if ([yuanString isEqualToString:@"0"]) {
            yuanString = @"0.00";
        } else {        
            //整数保留两位小数
            yuanString = [NSString stringWithFormat:@"%@.00",yuanString];
        }
    }else if(moneyInt%100%10 == 0){
        yuanString = [NSString stringWithFormat:@"%.2f",moneyInt/100.0];
    }else{
        yuanString = [NSString stringWithFormat:@"%.2f",moneyInt/100.0];
    }
    return yuanString;
    
}

+ (NSString *)handleStringCheckNull:(id)obj {
    if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    } else {
        if (obj == nil ||
            [obj isKindOfClass:[NSNull class]] ||
            [obj isEqual:[NSNull null]]) {
            return @"";
        } else {
            return [NSString stringWithFormat:@"%@",obj];
        }
    }
    return @"";
}
//随机生成47个字符串
+ (NSString *)generateTradeNO {
    
    static int kNumber = 47;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++) {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}
//*手机号码验证
+(BOOL) isValidateMobile:(NSString *)mobile
{
    if ([mobile length] == 0) {
        return NO;
    }
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(17[0-9])|(14[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}


//限制输入
+(BOOL)PWvalidateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"];
    int i = 0;
    while (i < number.length)
    {   NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

#pragma mark 判断密码
+ (BOOL) validatePassword:(NSString *)passWord
{
    /*
    NSString *passWordRegex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
    
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
    */
    
    BOOL result = false;
    if ([passWord length] >= 6){
        // 判断长度大于8位后再接着判断是否同时包含数字和字符
        NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:passWord];
    }
    return result;
}


/********************新增工具************************/
// 当需要改变Label中的多段字体属性时调用
+ (NSMutableAttributedString *)getColorsInLabel:(NSString *)allstring ColorString:(NSArray *)colorStringArray Colors:(NSArray *)colorArr fontSize:(CGFloat)size
{
    NSMutableAttributedString *allString = [[NSMutableAttributedString alloc]initWithString:allstring];
    
    [colorStringArray enumerateObjectsUsingBlock:^(NSString *colorString, NSUInteger idx, BOOL * _Nonnull stop) {
        NSRange stringRange = [allstring rangeOfString:colorString];
        NSMutableDictionary *stringDict = [NSMutableDictionary dictionary];
        if (colorArr.count>idx) {
            [stringDict setObject:colorArr[idx] forKey:NSForegroundColorAttributeName];
        } else {
            [stringDict setObject:colorArr[0] forKey:NSForegroundColorAttributeName];
        }
        [stringDict setObject:[UIFont systemFontOfSize:size] forKey:NSFontAttributeName];
        [allString setAttributes:stringDict range:stringRange];
    }];

    
    return allString;
}

// 当需要改变Label中得一段字体属性时调用
+ (NSMutableAttributedString *)getOneColorInLabel:(NSString *)allstring ColorString:(NSString *)string Color:(UIColor*)color fontSize:(float)size
{
    
    NSMutableAttributedString *allString = [[NSMutableAttributedString alloc]initWithString:allstring];
    
    NSRange stringRange = [allstring rangeOfString:string];
    NSMutableDictionary *stringDict = [NSMutableDictionary dictionary];
    [stringDict setObject:color forKey:NSForegroundColorAttributeName];
    [stringDict setObject:kFontSizeUse(size) forKey:NSFontAttributeName];
    [allString setAttributes:stringDict range:stringRange];
    
    return allString;
    
}

+ (CAShapeLayer *)getCAShapeLayerCornerRadiusRect:(CGRect)rect withRadius:(CGFloat)radius {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath;
    return  shapeLayer;
}

+ (CAShapeLayer *)getCornersWithRect:(CGRect)rect withUIRectCorner0:(UIRectCorner)UIRectCorner0 withUIRectCorner1:(UIRectCorner)UIRectCorner1 withRadius:(CGFloat)radius{
    UIBezierPath  *maskPath= [UIBezierPath  bezierPathWithRoundedRect:rect
                              
                                                    byRoundingCorners:UIRectCorner0 | UIRectCorner1
                              
                                                          cornerRadii:CGSizeMake(radius,radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer  alloc]  init];
    
    maskLayer.frame = rect;
    
    maskLayer.path = maskPath.CGPath;
    
    return maskLayer;
}

+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize

{
    NSDictionary *dict = @{NSFontAttributeName: font};
    CGSize size = [str boundingRectWithSize:maxSize
                                    options:NSStringDrawingTruncatesLastVisibleLine |
                   NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading
                                 attributes:dict
                                    context:nil].size;
    
    return size;
}

+ (CGFloat)heightWithString:(NSString *)string font:(UIFont *)font constrainedToWidth:(CGFloat)width
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize rtSize = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return ceil(rtSize.height) + 0.5;
}

+ (NSString *)getIphoneType {
    
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G";
    
    if ([platform isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    
    if ([platform isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    
    if ([platform isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    
    if ([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"]) return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"]) return @"iPad 2";
    
    
    if ([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,3"]) return @"iPad 2";
    
    
    if ([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,6"]) return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,7"]) return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"]) return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,2"]) return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,4"]) return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,5"]) return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,6"]) return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"]) return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,2"]) return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,3"]) return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,4"]) return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,5"]) return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,6"]) return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"i386"]) return @"iPhone Simulator";
    
    if ([platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    
    return platform;
    
}

+ (BOOL)isJailbroken {
    BOOL jailbroken = NO;
    NSString *cydiaPath = @"/Applications/Cydia.app";
    NSString *aptPath = @"/private/var/lib/apt/";
    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) {
        jailbroken = YES;
    }
    if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
        jailbroken = YES;
    }
    return jailbroken;
}
+ (UIView *)getLineView:(CGRect)frame color:(UIColor*)color {
    UIView *line = [[UIView alloc] initWithFrame:frame];
    line.backgroundColor = (color == nil ? MyRGBColor(235, 235, 235): color );
    return line;
}

+ (NSString *)getNullContent:(id)content backStr:(NSString *)backStr {
    return (content != nil) ? (NSString *)content : backStr;
}
+ (NSString *)getStarStr:(NSString *)allStr range:(NSRange )range {
    
    NSMutableString *starStr = [NSMutableString stringWithCapacity:range.length];
    for (int i = 0; i<range.length; i++) {
        [starStr appendString:@"*"];
    }
    NSString *str0 = [allStr substringToIndex:range.location];
    NSString *str1 = [allStr substringFromIndex:range.location+range.length];
    return [NSString stringWithFormat:@"%@%@%@",str0,starStr,str1];
    
}

+ (NSString *)handleSmkNum:(NSString *)card_no {
    if (card_no.length > 10) {
        NSMutableString *str = [[NSMutableString alloc] initWithString:card_no];
        [str insertString:@" " atIndex:4];
        [str insertString:@" " atIndex:9];
        return  [NSString stringWithFormat:@"%@",str];
    }
    return card_no;
}

+ (UIImageView *)getArrowImgCellHeight:(CGFloat)height bgWidth:(CGFloat)width rightSpace:(CGFloat)space {
    UIImageView *arrImg = [[UIImageView alloc] initWithFrame:CGRectMake(width-space-9, (height-15)/2, 9, 15)];
    arrImg.image = [UIImage imageNamed:@"xj_cell_arrow"];
    return arrImg;
}

#pragma mark == 对图片尺寸进行压缩--
+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}
+ (UIViewController*)getCurrentVC{
    
    return [CJTool topViewControllerWithRootViewController:[[UIApplication sharedApplication].delegate window].rootViewController];
    
}
+(UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController

{
    
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
        
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
        
    } else if (rootViewController.presentedViewController) {
        
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        
        return [self topViewControllerWithRootViewController:presentedViewController];
        
    } else {
        
        return rootViewController;
        
    }
    
}
//判断空值
+(BOOL)isBlankString:(NSString *)string
{
    if (string == nil || string == NULL || [string isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0)
    {
        return YES;
    }
    return NO;
}
@end
