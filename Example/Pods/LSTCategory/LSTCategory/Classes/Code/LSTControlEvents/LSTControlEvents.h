//
//  LSTControlEvents.h
//  LSTButton
//
//  Created by LoSenTrad on 2019/12/31.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (LSTControlEvents)

/** 添加事件 */
- (void)addControlEvents:(UIControlEvents)controlEvents withAction:(void(^)(id sender))action;

/** 移除事件 */
- (void)removeControlEvents:(UIControlEvents)controlEvents;

/** 添加事件 for key */
- (void)addControlEvents:(UIControlEvents)controlEvents withAction:(void(^)(id sender))action forKey:(NSString *)key;

/** 移除事件 for key */
- (void)removeControlEvents:(UIControlEvents)controlEvents forKey:(NSString *)key;

/** 添加点击事件 UIControlEventTouchUpInside */
- (void)addEventTouchUpInsideAction:(void(^)(id sender))action;

/** 移除点击事件 UIControlEventTouchUpInside*/
- (void)removeEventTouchUpInsideAction;

/** 移除全部事件 */
- (void)removeAllActions;


@end

NS_ASSUME_NONNULL_END
