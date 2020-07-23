//
//  UIColor+LSTColors.m
//  DYwttai
//
//  Created by LoSenTrad on 2017/3/21.
//  Copyright © 2017年 dongyu. All rights reserved.
//

#import "UIColor+LSTColor.h"



@implementation LSTColor (LSTColor)


+ (LSTColor *)lst_ColorWithString:(NSString *)hexString
{
    return [[self class] lst_ColorWithString:hexString alpha:1.0];
}

+ (LSTColor *)lst_ColorWithString:(NSString *)hexString alpha:(CGFloat)alpha
{
    // We found an empty string, we are returning nothing
    if (hexString.length == 0) {
        return nil;
    }
    
    // Check for hash and add the missing hash
    if('#' != [hexString characterAtIndex:0]) {
        hexString = [NSString stringWithFormat:@"#%@", hexString];
    }
    
    // returning no object on wrong alpha values
    NSArray *validHexStringLengths = @[@4, @5, @7, @9];
    NSNumber *hexStringLengthNumber = [NSNumber numberWithUnsignedInteger:hexString.length];
    if ([validHexStringLengths indexOfObject:hexStringLengthNumber] == NSNotFound) {
        return nil;
    }
    
    // if the hex string is 5 or 9 we are ignoring the alpha value and we are using the value from the hex string instead
    CGFloat handedInAlpha = alpha;
    if (5 == hexString.length || 9 == hexString.length) {
        NSString *alphaHex;
        if (5 == hexString.length) {
            alphaHex = [hexString substringWithRange:NSMakeRange(4, 1)];
        } else {
            alphaHex = [hexString substringWithRange:NSMakeRange(7, 2)];
        }
        if (1 == alphaHex.length) alphaHex = [NSString stringWithFormat:@"%@%@", alphaHex, alphaHex];
        //hexString = [NSString stringWithFormat:@"#%@", [hexString substringFromIndex:9 == hexString.length ? 7 : 3]];
        hexString = [NSString stringWithFormat:@"#%@", [hexString substringWithRange:NSMakeRange(1, 9 == hexString.length ? 6 : 3)]];
        unsigned alpha_u = [[self class] lst_HexValueToUnsigned:alphaHex];
        handedInAlpha = ((CGFloat) alpha_u) / 255.0;
    }
    
    // check for 3 character HexStrings
    hexString = [hexString lst_HexStringTransformFromThreeCharacters];
    
    NSString *redHex    = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(1, 2)]];
    unsigned redInt = [[self class] lst_HexValueToUnsigned:redHex];
    
    NSString *greenHex  = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(3, 2)]];
    unsigned greenInt = [[self class] lst_HexValueToUnsigned:greenHex];
    
    NSString *blueHex   = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(5, 2)]];
    unsigned blueInt = [[self class] lst_HexValueToUnsigned:blueHex];
    
    LSTColor *color = [LSTColor lst_ColorWith8BitRed:redInt green:greenInt blue:blueInt alpha:handedInAlpha];
    
    return color;
}

+ (LSTColor *)lst_ColorWith8BitRed:(NSInteger)red
                           green:(NSInteger)green
                            blue:(NSInteger)blue {
    return [[self class] lst_ColorWith8BitRed:red green:green blue:blue alpha:1.0];
}

+ (LSTColor *)lst_ColorWith8BitRed:(NSInteger)red
                           green:(NSInteger)green
                            blue:(NSInteger)blue
                           alpha:(CGFloat)alpha {
    LSTColor *color = nil;
#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
    color = [LSTColor colorWithRed:(float)red/255 green:(float)green/255 blue:(float)blue/255 alpha:alpha];
#else
    color = [LSTColor colorWithCalibratedRed:(float)red/255 green:(float)green/255 blue:(float)blue/255 alpha:alpha];
#endif
    
    return color;
}

+ (unsigned)lst_HexValueToUnsigned:(NSString *)hexValue
{
    unsigned value = 0;
    
    NSScanner *hexValueScanner = [NSScanner scannerWithString:hexValue];
    [hexValueScanner scanHexInt:&value];
    
    return value;
}

#pragma mark - ***** 常用颜色 *****

/**
 返回系统cell的分割线的颜色
 */
+ (nonnull LSTColor *)lst_CellSeparatorColor {
    return [self lst_ColorWithString:@"cccccc" alpha:1];
}

UIColor * LSTRGBColor(NSInteger r,NSInteger g,NSInteger b) {
    return [LSTColor colorWithRed:r green:g blue:b alpha:1];
}
UIColor * LSTRGBColorWithAlpha(NSInteger r,NSInteger g,NSInteger b,CGFloat alpha) {
    return [LSTColor colorWithRed:r green:g blue:b alpha:alpha];
}
UIColor * LSTHexColor(NSString *hexString) {
    return [LSTColor lst_ColorWithString:hexString];
}

UIColor * LSTHexColorWithAlpha(NSString *hexString,CGFloat alpha) {
    return [LSTColor lst_ColorWithString:hexString alpha:alpha];
}



@end

@implementation NSString (lst_StringTansformer)

- (NSString *)lst_HexStringTransformFromThreeCharacters;
{
    if(self.length == 4)
    {
        NSString * hexString = [NSString stringWithFormat:@"#%1$c%1$c%2$c%2$c%3$c%3$c",
                                [self characterAtIndex:1],
                                [self characterAtIndex:2],
                                [self characterAtIndex:3]];
        return hexString;
    }
    
    return self;
}

@end


