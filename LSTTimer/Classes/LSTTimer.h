//
//  LSTTimer.h
//  LSTTimer
//
//  Created by LoSenTrad on 2020/7/13.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

typedef void(^LSTTimerChangeBlock)(NSString *day, NSString *hour, NSString *minute, NSString *second, NSString *ms);
typedef void(^LSTTimerFinishBlock)(NSString *identifier);
typedef void(^LSTTimerPauseBlock)(NSString *identifier);



/** 倒计时变化通知类型 */
typedef NS_ENUM(NSInteger, LSTTimerSecondChangeNFType) {
    LSTTimerSecondChangeNFTypeNone = 0,
    LSTTimerSecondChangeNFTypeMS,        //每100ms(毫秒) 发出一次
    LSTTimerSecondChangeNFTypeSecond,    //每1s(秒) 发出一次

};

@interface LSTTimer : NSObject


/** 单例 */
LSTTimer *LSTTimerM(void);

#pragma mark - ***** 配置计时任务通知回调 *****
/// 设置倒计时任务的通知回调
/// @param name 通知名
/// @param identifier 倒计时任务的标识
/// @param type 倒计时变化通知类型
+ (void)setNotificationForName:(NSString *)name identifier:(NSString *)identifier changeNFType:(LSTTimerSecondChangeNFType)type;

#pragma mark - ***** 添加计时任务(100ms回调一次) *****
/// 添加计时任务
/// @param time 时间长度
/// @param handle 每100ms回调一次
+ (void)addTimerForTime:(NSTimeInterval)time handle:(LSTTimerChangeBlock)handle;
/// 添加计时任务
/// @param time 时间长度
/// @param identifier 计时任务标识
/// @param handle 每100ms回调一次
+ (void)addTimerForTime:(NSTimeInterval)time
             identifier:(NSString *)identifier
                 handle:(LSTTimerChangeBlock)handle;
/// 添加计时任务
/// @param time 时间长度
/// @param identifier 计时任务标识
/// @param handle 每100ms回调一次
/// @param finishBlock 计时完成回调
/// @param pauseBlock 计时暂停回调
+ (void)addTimerForTime:(NSTimeInterval)time
             identifier:(NSString *)identifier
                 handle:(LSTTimerChangeBlock)handle
                 finish:(LSTTimerFinishBlock)finishBlock
                  pause:(LSTTimerPauseBlock)pauseBlock;
/// 添加计时任务,持久化到硬盘
/// @param time 时间长度
/// @param identifier 计时任务标识
/// @param handle 每100ms回调一次
+ (void)addDiskTimerForTime:(NSTimeInterval)time
                 identifier:(NSString *)identifier
                     handle:(LSTTimerChangeBlock)handle;
/// 添加计时任务,持久化到硬盘
/// @param time 添加计时任务,持久化到硬盘
/// @param identifier 计时任务标识
/// @param handle 每100ms回调一次
/// @param finishBlock 计时完成回调
/// @param pauseBlock 计时暂停回调
+ (void)addDiskTimerForTime:(NSTimeInterval)time
                 identifier:(NSString *)identifier
                     handle:(LSTTimerChangeBlock)handle
                     finish:(LSTTimerFinishBlock)finishBlock
                      pause:(LSTTimerPauseBlock)pauseBlock;



#pragma mark - ***** 添加计时任务(1s回调一次) *****
/// 添加计时任务
/// @param time 时间长度
/// @param handle 计时任务标识
+ (void)addMinuteTimerForTime:(NSTimeInterval)time handle:(LSTTimerChangeBlock)handle;
/// 添加计时任务
/// @param time 时间长度
/// @param identifier 计时任务标识
/// @param handle 每100ms回调一次
+ (void)addMinuteTimerForTime:(NSTimeInterval)time
                   identifier:(NSString *)identifier
                       handle:(LSTTimerChangeBlock)handle;

/// 添加计时任务
/// @param time 时间长度
/// @param identifier 计时任务标识
/// @param handle 每100ms回调一次
/// @param finishBlock 计时完成回调
/// @param pauseBlock 计时暂停回调
+ (void)addMinuteTimerForTime:(NSTimeInterval)time
                   identifier:(NSString *)identifier
                       handle:(LSTTimerChangeBlock)handle
                       finish:(LSTTimerFinishBlock)finishBlock
                        pause:(LSTTimerPauseBlock)pauseBlock;

/// 添加计时任务
/// @param time 时间长度
/// @param identifier 计时任务标识
/// @param handle 每100ms回调一次
/// @param finishBlock 计时完成回调
/// @param pauseBlock 计时暂停回调
+ (void)addDiskMinuteTimerForTime:(NSTimeInterval)time
                       identifier:(NSString *)identifier
                           handle:(LSTTimerChangeBlock)handle
                           finish:(LSTTimerFinishBlock)finishBlock
                            pause:(LSTTimerPauseBlock)pauseBlock;


#pragma mark - ***** 获取计时任务时间间隔 *****
/// 通过任务标识获取 计时任务 间隔(毫秒)
/// @param identifier 计时任务标识
+ (NSTimeInterval)getTimeIntervalForIdentifier:(NSString *)identifier;


#pragma mark - ***** 暂停计时任务 *****
/// 通过标识暂停计时任务
/// @param identifier 计时任务标识
+ (BOOL)pauseTimerForIdentifier:(NSString *)identifier;
/// 暂停所有计时任务
+ (void)pauseAllTimer;

#pragma mark - ***** 重启计时任务 *****
/// 通过标识重启 计时任务
/// @param identifier 计时任务标识
+ (BOOL)restartTimerForIdentifier:(NSString *)identifier;
/// 重启所有计时任务
+ (void)restartAllTimer;

#pragma mark - ***** 重置计时任务(恢复初始状态) *****
/// 通过标识重置 计时任务
/// @param identifier 计时任务标识
+ (BOOL)resetTimerForIdentifier:(NSString *)identifier;
/// 重置所有计时任务
+ (void)resetAllTimer;

#pragma mark - ***** 移除计时任务 *****
/// 通过标识移除计时任务
/// @param identifier 计时任务标识
+ (BOOL)removeTimerForIdentifier:(NSString *)identifier;
/// 移除所有计时任务
+ (void)removeAllTimer;

#pragma mark - ***** 格式化时间 *****
/// 将毫秒数 格式化成  时:分:秒:毫秒
/// @param time 时间长度(毫秒单位)
/// @param handle 格式化完成回调
+ (void)formatDateForTime:(NSTimeInterval)time handle:(LSTTimerChangeBlock)handle;

@end

NS_ASSUME_NONNULL_END
