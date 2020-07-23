//
//  UIColor+LSTColors.h
//  DYwttai
//
//  Created by LoSenTrad on 2017/3/21.
//  Copyright © 2017年 dongyu. All rights reserved.
//

#import "TargetConditionals.h"

#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
#import <UIKit/UIKit.h>
#define LSTColor UIColor
#else
#import <Cocoa/Cocoa.h>
#define LSTColor NSColor
#endif

@interface LSTColor (LSTColor)

#pragma mark - ***** 十六进制和RGB颜色获取 *****

/**
 Creates a UIColor or NSColor from a HexString like #fff, #ffff, #ff00aa or #ff00aaee.
 With complete support for short hand hex values, short hand with short alpha value, full
 hex values and full hex values with alpha. To include alpha with the hex string append the values
 at the end of the string.
 
 @param hexString NSString hex string for color generation
 @return UIColor / NSColor or nil
 */
+ (nullable LSTColor *)lst_ColorWithString:(nonnull NSString *)hexString;

/**
 Same implementation as hx_colorWithHexRGBAString but you can hand in a normal alpha value from 0 to 1
 
 @param hexString NSString hex string for color generation
 @param alpha CGFloat from 0 to 1
 @return UIColor / NSColor or nil
 */
+ (nullable LSTColor *)lst_ColorWithString:(nonnull NSString *)hexString alpha:(CGFloat)alpha;

/**
 Don't like to devide by 255 to get a value between 0 to 1 for creating a color? This helps you create
 a UIColor without the hassle, which leads to cleaner code
 
 @param red NSInteger hand in a value for red between 0 and 255
 @param green NSInteger hand in a value for green between 0 and 255
 @param blue NSInteger hand in a value for blue between 0 and 255
 @return UIColor / NSColor
 */
+ (nonnull LSTColor *)lst_ColorWith8BitRed:(NSInteger)red
                                     green:(NSInteger)green
                                      blue:(NSInteger)blue;

/**
 Same implementation as hx_colorWith8BitRed:green:blue but you can hand in a normal alpha value from 0 to 1
 
 @param red NSInteger hand in a value for red between 0 and 255
 @param green NSInteger hand in a value for green between 0 and 255
 @param blue NSInteger hand in a value for blue between 0 and 255
 @param alpha CGFloat from 0 to 1
 @return UIColor / NSColor
 */
+ (nonnull LSTColor *)lst_ColorWith8BitRed:(NSInteger)red
                                     green:(NSInteger)green
                                      blue:(NSInteger)blue
                                     alpha:(CGFloat)alpha;

#pragma mark - ***** 常用颜色 *****

/**
  返回系统cell的分割线的颜色
 */
+ (nonnull LSTColor *)lst_CellSeparatorColor;

/** 以下为C语言 语法快捷调用颜色设置 **/

/** rbg颜色 */
UIColor * _Nullable LSTRGBColor(NSInteger r,NSInteger g,NSInteger b);
/** rbg颜色 带alpha */
UIColor * _Nullable LSTRGBColorWithAlpha(NSInteger r,NSInteger g,NSInteger b,CGFloat alpha);
/** 十六进制颜色  */
UIColor * _Nullable LSTHexColor(NSString * _Nullable hexString);
/** 十六进制颜色 带alpha */
UIColor * _Nullable LSTHexColorWithAlpha(NSString * _Nullable hexString,CGFloat alpha);


@end


@interface NSString (lst_StringTansformer)

/**
 检查十六进制字符串比如#fff,并给转化成十六进制字符串,比如#ffffff
 
 @return 返回标准的7位十六进制字符串或者初始化一个字符串为十六进制字符串
 */
- (nonnull NSString *)lst_HexStringTransformFromThreeCharacters;

@end

