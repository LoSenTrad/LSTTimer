//
//  NSString+LSTString.m
//  DYwttai
//
//  Created by LoSenTrad on 2017/7/11.
//  Copyright © 2017年 dongyu. All rights reserved.
//

#import "NSString+LSTString.h"
#import <CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>
#import <sys/sysctl.h>
#import <mach/mach.h>

@implementation NSString (LSTString)

- (NSString *)base64Encode {
    //1、先转换成二进制数据
    NSData *data =[self dataUsingEncoding:NSUTF8StringEncoding];
    //2、对二进制数据进行base64编码，完成后返回字符串
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)base64DecodeString {
    //注意：该字符串是base64编码后的字符串
    //1、转换为二进制数据（完成了解码的过程）
    NSData *data=[[NSData alloc] initWithBase64EncodedString:self options:0];
    //2、把二进制数据转换成字符串
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+ (nonnull NSString *)valiMobile:(NSString *)mobile {
    if (mobile.length < 11)
    {
        return @"输入正确的11位手机号码";
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(170)|(171)|(172)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return nil;
        }else{
            return @"请输入正确的电话号码";
        }
    }
    return nil;
}

- (BOOL)validatePhoneNumber {
    if (self.length < 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(166)|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(170)|(172)|(199)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:self];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:self];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:self];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
    return YES;
}

- (BOOL) validateEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}
//判断字符串是不是全部是空格
+ (BOOL) isEmpty:(NSString *) str {
    if (!str) {
        return true;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
    //[str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO
}

+ (NSString *) paramValueOfUrl:(NSString *) url withParam:(NSString *) param{
    
    NSError *error;
    NSString *regTags=[[NSString alloc] initWithFormat:@"(^|&|\\?)+%@=+([^&]*)(&|$)",param];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regTags
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    // 执行匹配的过程
    NSArray *matches = [regex matchesInString:url
                                      options:0
                                        range:NSMakeRange(0, [url length])];
    for (NSTextCheckingResult *match in matches) {
        NSString *tagValue = [url substringWithRange:[match rangeAtIndex:2]];  // 分组2所对应的串
        return tagValue;
    }
    return nil;
}

+ (BOOL)compareAppVersion:(NSString *)NewVersion withOldVersion:(NSString *)oldVersion {
    if ([NewVersion compare:oldVersion options:NSNumericSearch] == NSOrderedDescending) {
        return YES ;
    }else{
        return NO;
    }
}

/** md5 一般加密 */
- (NSString *)md5String {
    const char *myPasswd = [self UTF8String];
    unsigned char mdc[16];
    CC_MD5(myPasswd, (CC_LONG)strlen(myPasswd), mdc);
    NSMutableString *md5String = [NSMutableString string];
    for (int i = 0; i< 16; i++) {
        [md5String appendFormat:@"%02x",mdc[i]];
    }
    return md5String;
}

+ (NSString *)uppercaseString:(NSString *)str {
    return [str uppercaseString];
}

+ (NSString *)lowercaseString:(NSString *)str {
    return [str lowercaseString];
}

- (BOOL)isBlankString {
    if (self == nil || self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}


- (BOOL)lst_containsString:(NSString *)subString
{
    return ([self rangeOfString:subString].location == NSNotFound) ? NO : YES;
}

- (BOOL)containsOnlyNumbersAndLetters
{
    NSCharacterSet *numAndLetterCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:numAndLetterCharSet].location == NSNotFound);
}

- (NSArray *)stringToArrayWithSeparator:(NSString *)separator {
    return [self componentsSeparatedByString:separator];
}

- (NSString *)cutString:(NSUInteger)location cutLength:(NSUInteger)length {
    return [self substringWithRange:NSMakeRange(location,length)];
}

+ (NSString *)getTimeStamp {
    return [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
}


- (nonnull NSURL *)stringToURL {
    return [NSURL URLWithString:self];
}

/** 根据字符串获取宽度 (不适合富文本) */
- (CGFloat)getWidthWithFont:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = self;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}
/** 根据字符串获取高度(不适合富文本) */
- (CGFloat)getHeightWithFont:(UIFont *)font andWidth:(CGFloat)width {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = self;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

#pragma mark - ***** 获取系统信息 *****

+ (NSString *_Nullable)lst_loadAppVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (float)lst_loadSystemVersion {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

/** 获取手机型号 */
+ (NSString *)lst_loadDeviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"])   return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"])   return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])   return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])   return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])   return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])   return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])   return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])   return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])   return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"])   return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"])   return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"])   return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"])   return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"])   return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])   return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"])   return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"])   return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"])   return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"])   return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"])   return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,1"])   return @"国行、日版、港行iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"])   return @"港行、国行iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,3"])   return @"美版、台版iPhone 7";
    if ([platform isEqualToString:@"iPhone9,4"])   return @"美版、台版iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"])  return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,4"])  return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"])  return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"])  return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"])  return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"])  return @"iPhone X GSM";//联通移动双通版本
    if ([platform isEqualToString:@"iPhone11,8"])  return @"iPhone XR";
    if ([platform isEqualToString:@"iPhone11,2"])  return @"iPhone XS";
    if ([platform isEqualToString:@"iPhone11,4"])  return @"iPhone XS Max (China)";
    if ([platform isEqualToString:@"iPhone11,6"])  return @"iPhone XS Max";

    
    if ([platform isEqualToString:@"iPod1,1"])     return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])     return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])     return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])     return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])     return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"])     return @"iPad 1G";
    if ([platform isEqualToString:@"iPad2,1"])     return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])     return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])     return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])     return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])     return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])     return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])     return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad3,1"])     return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])     return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])     return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])     return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])     return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])     return @"iPad 4";
    if ([platform isEqualToString:@"iPad4,1"])     return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])     return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])     return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])     return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"])     return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"])     return @"iPad Mini 2G";
    if ([platform isEqualToString:@"i386"])        return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])      return @"iPhone Simulator";
#ifdef  DEBUG
    NSLog(@"NOTE: Unknown device type: %@", platform);
#endif
    return platform;
}

+ (NSString*)lst_loadBundleID{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

- (CGSize)heightWithFont:(UIFont *)font
                MaxWidth:(float)width{
    if (self.length==0) {
        return CGSizeMake(0, 0);
    }
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingTruncatesLastVisibleLine |
                   NSStringDrawingUsesLineFragmentOrigin|
                   NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil];
    
    return CGSizeMake((rect.size.width), (rect.size.height));
    
}

/** 通过名字读取uiimage */
- (UIImage *)getImage {
    return [UIImage imageNamed:self];
}


@end

@implementation NSString (AttributedString)

/********************************************************************
 *  计算富文本字体高度
 *
 *  lineSpeace 行高
 *  param font              字体
 *  param width            字体所占宽度
 *
 *  @return 富文本高度
 ********************************************************************/

-(CGFloat)HeightParagraphSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font AndWidth:(CGFloat)width {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    /** 行高 */
    paraStyle.lineSpacing = lineSpeace;
    // NSKernAttributeName字体间距
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f };
    CGSize size = [self boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}
@end
