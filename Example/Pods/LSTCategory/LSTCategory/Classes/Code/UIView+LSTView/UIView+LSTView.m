//
//  UIView+LSTView.m
//  KitNote
//
//  Created by LoSenTrad on 2018/5/30.
//  Copyright © 2018年 LoSenTrad. All rights reserved.
//

#import "UIView+LSTView.h"

#define kShadowViewTag 2132
#define kValidDirections [NSArray arrayWithObjects: @"top", @"bottom", @"left", @"right",nil]

@implementation UIView (QTFrame)


- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setSize:(CGSize)size
{
    
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(CGFloat)centerX{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

-(CGFloat)centerY{
    return self.center.y;
}

- (CGSize)size
{
    return self.frame.size;
}

- (CGFloat) top
{
    return self.frame.origin.y;
}

- (void) setTop: (CGFloat) newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat) left
{
    return self.frame.origin.x;
}

- (void) setLeft: (CGFloat) newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

- (CGFloat) bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void) setBottom: (CGFloat) newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat) right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void) setRight: (CGFloat) newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}


CGSize LSTScreenSize() {
    static CGSize size;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size = [UIScreen mainScreen].bounds.size;
        if (size.height <= size.width) {
            CGFloat tmp = size.height;
            size.height = size.width;
            size.width = tmp;
        }
    });
    return size;
}

CGFloat LSTScreenWidth() {
    static CGSize size;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size = [UIScreen mainScreen].bounds.size;
        if (size.height <= size.width) {
            CGFloat tmp = size.height;
            size.height = size.width;
            size.width = tmp;
        }
    });
    return size.width;
}

CGFloat LSTScreenHeight() {
    static CGSize size;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size = [UIScreen mainScreen].bounds.size;
        if (size.height <= size.width) {
            CGFloat tmp = size.height;
            size.height = size.width;
            size.width = tmp;
        }
    });
    return size.height;
}

CGFloat LSTAutoWidth(CGFloat width) {
    return  LSTScreenWidth() * (width/LSTScreenWidth());
}
CGFloat LSTAutoHeight(CGFloat height) {
    return  LSTScreenHeight() * (height/LSTScreenHeight());
}
CGFloat LSTAutoWidthForView(CGFloat width,UIView *tagView) {
    return 0;
}
CGFloat LSTAutoHeightForView(CGFloat height,UIView *tagView) {
    return 0;
}

CGRect LSTScreenBounds() {
    static CGRect bounds;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bounds = [UIScreen mainScreen].bounds;
    });
    return bounds;
}

#define widthRatio(_f_) (_f_) * LSTScreenWidth()

static inline CGSize QTSizeMake(CGFloat width, CGFloat height){
    CGSize size; size.width = widthRatio(width); size.height = widthRatio(height); return size;
}

static inline CGPoint QTPointMake(CGFloat x, CGFloat y){
    CGPoint point; point.x = widthRatio(x); point.y = widthRatio(y); return point;
}

static inline CGRect QTRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height){
    CGRect rect;
    rect.origin.x = widthRatio(x); rect.origin.y = widthRatio(y);
    rect.size.width = widthRatio(width); rect.size.height = widthRatio(height);
    return rect;
}

/** 是否是苹果X */
BOOL lst_IsIphoneX() {
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO);
}
/** 是否是苹果XR */
BOOL lst_IsIphoneXR() {
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1624), [[UIScreen mainScreen] currentMode].size) : NO);
}
/** 是否是苹果XS */
BOOL lst_IsIphoneXS() {
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO);
}
/** 是否是苹果XS_Max */
BOOL lst_IsIphoneXS_Max() {
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size): NO);
}
/** 是否是苹果X系列(刘海屏系列) */
BOOL lst_IsIphoneX_ALL() {
    return (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), LSTScreenSize())|| CGSizeEqualToSize(CGSizeMake(812.f, 375.f), LSTScreenSize())  || CGSizeEqualToSize(CGSizeMake(414.f, 896.f), LSTScreenSize()) || CGSizeEqualToSize(CGSizeMake(896.f, 414.f), LSTScreenSize()));
    //或者以下方法判断
//    BOOL isPhoneX = NO;
//        if (@available(iOS 11.0, *)) {
//            isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
//        }
}

/** 状态栏高度 X:44 非X:20 */
CGFloat LSTStatusBarHeight() {
    if (lst_IsIphoneX_ALL()) {
        return 44;
    } else {
        return 20;
    }
}
/** 导航栏高度 X:88 非X:64 */
CGFloat LSTNavBarHeight() {
    if (lst_IsIphoneX_ALL()) {
        return 44+44;
    } else {
        return 44+20;
    }
}
/** 底部导航栏高度 X:83 非X:49 */
CGFloat LSTTabBarHeight() {
    if (lst_IsIphoneX_ALL()) {
        return 49+34;
    } else {
        return 49;
    }
}
/** 标签栏高度 X:34 非X:0 */
CGFloat LSTTabBarBottomMargin() {
    if (lst_IsIphoneX_ALL()) {
        return 34;
    } else {
        return 0;
    }
}

/** 底部贴边控件高度 */
CGFloat LSTBottomHemViewHeight(CGFloat height) {
    if (lst_IsIphoneX_ALL()) {
        return (height+20)>64?64:height+20;
    }else {
        return height;
    }
}
/** 底部控件下间距 (间距小于20使用) */
CGFloat LSTBottomHemViewMargin(CGFloat margin) {
    if (lst_IsIphoneX_ALL()) {
        return margin+15;
    }else {
        return margin;
    }
}

+ (instancetype)getNibView:(NSString *)nibName {
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    return [nib instantiateWithOwner:nil options:nil].firstObject;
}

- (void)lst_RoundCorners:(UIRectCorner)corners radius:(CGFloat)radius {
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)].CGPath;
    self.layer.mask = maskLayer;
}

- (UIImage *)lst_SnapshotImage {
    UIGraphicsBeginImageContext(self.bounds.size);
    if([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]){
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    } else{
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *imageData = UIImageJPEGRepresentation(image, 0.6);
    image = [UIImage imageWithData:imageData];
    return image;
}
/** 获取当前屏幕顶层控制器 */
- (UIViewController *)getCurrVc {
    //获得当前活动窗口的根视图
    UIViewController* vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1)
    {
        //根据不同的页面切换方式，逐步取得最上层的viewController
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
            if ([vc isKindOfClass:[UITabBarController class]]) {
                vc = ((UITabBarController*)vc).selectedViewController;
            }
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}

- (NSData *)snapshotPDF {
    CGRect bounds = self.bounds;
    NSMutableData* data = [NSMutableData data];
    CGDataConsumerRef consumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef)data);
    CGContextRef context = CGPDFContextCreate(consumer, &bounds, NULL);
    CGDataConsumerRelease(consumer);
    if (!context) return nil;
    CGPDFContextBeginPage(context, NULL);
    CGContextTranslateCTM(context, 0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    [self.layer renderInContext:context];
    CGPDFContextEndPage(context);
    CGPDFContextClose(context);
    CGContextRelease(context);
    return data;
}

- (void)removeAllSubviews {
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

- (void) makeInsetShadow {
    NSArray *shadowDirections = [NSArray arrayWithObjects:@"top", @"bottom", @"left" , @"right" , nil];
    UIColor *color = [UIColor colorWithRed:(0.0) green:(0.0) blue:(0.0) alpha:0.5];
    
    UIView *shadowView = [self createShadowViewWithRadius:3 Color:color Directions:shadowDirections];
    shadowView.tag = kShadowViewTag;
    
    [self addSubview:shadowView];
}

- (void) makeInsetShadowWithRadius:(float)radius Alpha:(float)alpha {
    NSArray *shadowDirections = [NSArray arrayWithObjects:@"top", @"bottom", @"left" , @"right" , nil];
    UIColor *color = [UIColor colorWithRed:(0.0) green:(0.0) blue:(0.0) alpha:alpha];
    
    UIView *shadowView = [self createShadowViewWithRadius:radius Color:color Directions:shadowDirections];
    shadowView.tag = kShadowViewTag;
    
    [self addSubview:shadowView];
}

- (void) makeInsetShadowWithRadius:(float)radius Color:(UIColor *)color Directions:(NSArray *)directions {
    UIView *shadowView = [self createShadowViewWithRadius:radius Color:color Directions:directions];
    shadowView.tag = kShadowViewTag;
    
    [self addSubview:shadowView];
}

- (UIView *) createShadowViewWithRadius:(float)radius Color:(UIColor *)color Directions:(NSArray *)directions {
    UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    shadowView.backgroundColor = [UIColor clearColor];
    
    // Ignore duplicate direction
    NSMutableDictionary *directionDict = [[NSMutableDictionary alloc] init];
    for (NSString *direction in directions) [directionDict setObject:@"1" forKey:direction];
    
    //    for (NSString *direction in directionDict) {
    //        // Ignore invalid direction
    //        if ([kValidDirections containsObject:direction])
    //        {
    //            CAGradientLayer *shadow = [CAGradientLayer layer];
    //            shadow.locations = @[@(0.0),@(0.5)];
    //
    //            if ([direction isEqualToString:@"top"]) {
    //                [shadow setStartPoint:CGPointMake(0.5, 0.0)];
    //                [shadow setEndPoint:CGPointMake(0.5, 1.0)];
    //                shadow.frame = CGRectMake(-radius, -radius, self.bounds.size.width + radius*2, radius);
    //                shadow.colors = [NSArray arrayWithObjects:(id)[self.backgroundColor CGColor], (id)[color CGColor], nil];
    //            }
    //            else if ([direction isEqualToString:@"bottom"])
    //            {
    //                [shadow setStartPoint:CGPointMake(0.5, 1.0)];
    //                [shadow setEndPoint:CGPointMake(0.5, 0.0)];
    //                shadow.frame = CGRectMake(-radius, self.bounds.size.height, self.bounds.size.width + radius*2, radius);
    //                shadow.colors = [NSArray arrayWithObjects:(id)[self.backgroundColor CGColor] ,(id)[color CGColor], nil];
    //            } else if ([direction isEqualToString:@"left"])
    //            {
    //                shadow.frame = CGRectMake(-radius, -radius, radius, self.bounds.size.height + radius*2);
    //                [shadow setStartPoint:CGPointMake(0.0, 0.5)];
    //                [shadow setEndPoint:CGPointMake(1.0, 0.5)];
    //                shadow.colors = [NSArray arrayWithObjects:(id)[self.backgroundColor CGColor],(id)[color CGColor], nil];
    //
    //            } else if ([direction isEqualToString:@"right"])
    //            {
    //                shadow.frame = CGRectMake(self.bounds.size.width, -radius, radius, self.bounds.size.height + radius*2);
    //                [shadow setStartPoint:CGPointMake(1.0, 0.5)];
    //                [shadow setEndPoint:CGPointMake(0.0, 0.5)];
    //                shadow.colors = [NSArray arrayWithObjects:(id)[self.backgroundColor CGColor],(id)[color CGColor], nil];
    //            }
    //            // 后边一个颜色要和所加视图背景颜色一样
    //
    //            [shadowView.layer insertSublayer:shadow atIndex:0];
    //        }
    //    }
    
    for (NSString *direction in directionDict) {
        // Ignore invalid direction
        if ([kValidDirections containsObject:direction])
        {
            CALayer *shadow = [CAGradientLayer layer];
            shadow.backgroundColor = color.CGColor;
            
            if ([direction isEqualToString:@"top"]) {
                shadow.frame = CGRectMake(0, 0, self.bounds.size.width, radius);
            }
            else if ([direction isEqualToString:@"bottom"])
            {
                shadow.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, radius);
            } else if ([direction isEqualToString:@"left"])
            {
                shadow.frame = CGRectMake(0, 0, radius, self.bounds.size.height );
            } else if ([direction isEqualToString:@"right"])
            {
                shadow.frame = CGRectMake(self.bounds.size.width, 0, radius, self.bounds.size.height);
            }
            [shadowView.layer insertSublayer:shadow atIndex:0];
        }
    }
    
    
    return shadowView;
}

- (void)addBorderWithColor:(UIColor *)color size:(CGFloat)size borderTypes:(NSArray *)types{
    for (int i = 0 ; i < types.count; i ++) {
        [self addBorderLayerWithColor:color size:size borderType:[types[i] integerValue]];
    }
}

- (void)addBorderLayerWithColor:(UIColor *)color size:(CGFloat)size borderType:(LSTBorderType)boderType{
    CALayer * layer = [CALayer layer];
    layer.backgroundColor = color.CGColor;
    [self.layer addSublayer:layer];
    [UIFont systemFontOfSize:4];
    switch (boderType) {
        case LSTBorderTypeTop:
            layer.frame = CGRectMake(0, 0, self.frame.size.width, size);
            break;
        case LSTBorderTypeLeft:
            layer.frame = CGRectMake(0, 0, size, self.frame.size.height);
            break;
        case LSTBorderTypeBottom:
            layer.frame = CGRectMake(0, self.frame.size.height - size, self.frame.size.width, size);
            break;
        case LSTBorderTypeRight:
            layer.frame = CGRectMake(self.frame.size.width - size, 0, size, self.frame.size.height);
            break;
        default:
            break;
    }
    
}


/** 取消以上方法 发出警告 */
- (void)temp {
    QTPointMake(0, 0);
    QTSizeMake(0, 0);
    QTRectMake(0, 0, 0, 0);
    lst_IsIphoneX();
    lst_IsIphoneXR();
    lst_IsIphoneXS();
    lst_IsIphoneXS_Max();
    lst_IsIphoneX_ALL();
}

@end
