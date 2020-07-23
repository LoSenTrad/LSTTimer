//
//  NSString+LSTString.h
//  DYwttai
//
//  Created by LoSenTrad on 2017/7/11.
//  Copyright © 2017年 dongyu. All rights reserved.
// 0.1.12231756

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (LSTString)

NS_ASSUME_NONNULL_BEGIN

/** base64编码 */
- (NSString *)base64Encode;
/** base64解码 */
- (NSString *)base64DecodeString;

//判断是不是符合的手机号码
+ (NSString *)valiMobile:(NSString *)mobile;
//检测是否是邮箱
- (BOOL)validateEmail;
/** 验证是否是手机号码 */
- (BOOL)validatePhoneNumber;

//判断字符串是不是全部是空格
+ (BOOL)isEmpty:(NSString *)str;
//获取url的key对应的值
+ (NSString *)paramValueOfUrl:(NSString *)url withParam:(NSString *) param;
//比较app版本号
+ (BOOL)compareAppVersion:(NSString *)NewVersion withOldVersion:(NSString *)oldVersion;
/** md5 一般加密 */
- (NSString *)md5String;
/** 字符串转大写 */
+ (NSString *)uppercaseString:(NSString *)str;
/** 字符串转小写 */
+ (NSString *)lowercaseString:(NSString *)str;
/** 判断字符串是否为空 */
- (BOOL)isBlankString;
/** 判断字符串中是否包含某字符串 */
- (BOOL)lst_containsString:(NSString *)subString;
/** 判断字符串是包含数字和字母 */
- (BOOL)containsOnlyNumbersAndLetters;
/** 字符串转数组 @param separator 分隔符 */
- (NSArray *)stringToArrayWithSeparator:(NSString *)separator;
/**
 *  截取字符串
 *  @param location 从第几位开始
 *  @param length   截取多少位
 */
- (NSString *)cutString:(NSUInteger)location cutLength:(NSUInteger)length;
/** 获取当前时间戳 */
+ (nonnull NSString *)getTimeStamp;
/** string类型转URL类型 */

- (nonnull NSURL *)stringToURL;
/** 根据字符串获取宽度 (不适合富文本)(修改标记) */
- (CGFloat)getWidthWithFont:(UIFont *)font;
/** 根据字符串获取高度(不适合富文本) */
- (CGFloat)getHeightWithFont:(UIFont *)font andWidth:(CGFloat)width;

#pragma mark - ***** 获取系统信息 *****
/** 获取app版本号 */
+ (NSString *_Nullable)lst_loadAppVersion;
/** 获取系统版本 */
+ (float)lst_loadSystemVersion;
/** 获取手机型号 */
+ (NSString *)lst_loadDeviceModel;
/** 获取app唯一标识 */
+ (NSString*)lst_loadBundleID;

- (CGSize)heightWithFont:(UIFont *)font MaxWidth:(float)width;
/** 通过名字读取uiimage */
- (UIImage *)getImage;

@end

@interface NSString (AttributedString)

-(CGFloat)HeightParagraphSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font AndWidth:(CGFloat)width;


@end

NS_ASSUME_NONNULL_END
