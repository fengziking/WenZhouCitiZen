//
//  Common_Color.h
//  JinHuaCitizen
//
//  Created by Frank-Lee on 17/8/3.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#ifndef Common_Color_h
#define Common_Color_h



/**
 *  RGB色
 */
#define MyRGBColor(R,G,B) [UIColor colorWithRed:R /255.0 green:G / 255.0 blue:B / 255.0 alpha:1]
/**
 *  设置16进制颜色
 */
#define COLOR_16HEX_LIGHT_BLUE_SET(HEXValue) [UIColor colorWithRed:((float)((HEXValue & 0xFFFFFF) >> 16))/255.0 green:((float)((HEXValue & 0xFFFF) >> 8))/255.0 blue:((float)(HEXValue & 0xFF))/255.0 alpha:1.0] // 设置16进制颜色

// 设置颜色 示例：UIColorHex(0x26A7E8)
#define KColorHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/// 透明色
#define KColorClear [UIColor clearColor]
/// 白色
#define KColorWhite KColorHex(0xffffff) //
/// 黑色-纯黑
#define KColorBlack KColorHex(0x000000)
/// 绿色
#define KColorGreen KColorHex(0x349c6f)
/// 橙色
#define KColorOrange KColorHex(0xf39700)
/// 红色
#define KColorRed KColorHex(0xff4b3b)
/// 蓝色
#define KColorBlue KColorHex(0x00a0e9)

//灰色背景色
#define KColorMainGray  MyRGBColor(245,245,245)
#define KColorMainBlue  MyRGBColor(48,152,233)
#define KColorLine      MyRGBColor(235, 235, 235)


#define KColor6666 KColorHex(0x666666)

#define KColor3333 KColorHex(0x333333)

#define KColor9999 KColorHex(0x999999)



#endif /* Common_Color_h */
