//
//  LSTTimerDemoVC.m
//  LSTTimer_Example
//
//  Created by LoSenTrad on 2020/7/15.
//  Copyright © 2020 490790096@qq.com. All rights reserved.
//

#import "LSTTimerDemoVC.h"
#import <LSTTimer.h>

@interface LSTTimerDemoVC ()
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;


@property (weak, nonatomic) IBOutlet UILabel *gLab1;
@property (weak, nonatomic) IBOutlet UILabel *gLab2;
@property (weak, nonatomic) IBOutlet UILabel *gLab3;
@property (weak, nonatomic) IBOutlet UILabel *gLab4;
@property (weak, nonatomic) IBOutlet UILabel *gLab5;


@property (weak, nonatomic) IBOutlet UILabel *hmsLab1;
@property (weak, nonatomic) IBOutlet UILabel *hmsLab2;
@property (weak, nonatomic) IBOutlet UILabel *hmsLab3;

@property (weak, nonatomic) IBOutlet UILabel *dayLab1;
@property (weak, nonatomic) IBOutlet UILabel *dayLab2;
@property (weak, nonatomic) IBOutlet UILabel *dayLab3;
@property (weak, nonatomic) IBOutlet UILabel *dayLab4;


@property (weak, nonatomic) IBOutlet UILabel *rLab1;
@property (weak, nonatomic) IBOutlet UILabel *rLab2;
@property (weak, nonatomic) IBOutlet UILabel *rLab3;
@property (weak, nonatomic) IBOutlet UILabel *rLab4;

@property (weak, nonatomic) IBOutlet UILabel *jLab1;
@property (weak, nonatomic) IBOutlet UILabel *jLab2;
@property (weak, nonatomic) IBOutlet UILabel *jLab3;

@end

@implementation LSTTimerDemoVC

#pragma mark - ***** Controller Life Cycle 控制器生命周期 *****

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self layoutSubViewUI];
    
    self.gLab1.layer.cornerRadius = 5;
    
    self.gLab2.layer.cornerRadius = 2;
    self.gLab3.layer.cornerRadius = 2;
    self.gLab4.layer.cornerRadius = 2;
    
    
    self.gLab1.layer.masksToBounds = YES;
    self.gLab2.layer.masksToBounds = YES;
    self.gLab3.layer.masksToBounds = YES;
    self.gLab4.layer.masksToBounds = YES;
    
}

- (void)dealloc {
    //当前控制器销毁  以前所有倒计时任务
    [LSTTimer removeAllTimer];
}



#pragma mark - ***** setupUI 界面布局 *****

- (void)layoutSubViewUI {
    
    self.title = @"常用示例";
    
     __weak typeof(self) weakSelf = self;
    [LSTTimer addTimerForTime:10 handle:^(NSString * _Nonnull day, NSString * _Nonnull hour, NSString * _Nonnull minute, NSString * _Nonnull second, NSString * _Nonnull ms) {
        weakSelf.lab1.text = [NSString stringWithFormat:@"%@.%@",second,ms];
    }];
    
    
    
    [LSTTimer addTimerForTime:3608 handle:^(NSString * _Nonnull day, NSString * _Nonnull hour, NSString * _Nonnull minute, NSString * _Nonnull second, NSString * _Nonnull ms) {
        weakSelf.lab2.text = [NSString stringWithFormat:@"%@:%@:%@.%@",hour,minute,second,ms];
    }];
    
    
    //一天10秒 = 86410秒
    [LSTTimer addTimerForTime:86410 handle:^(NSString * _Nonnull day, NSString * _Nonnull hour, NSString * _Nonnull minute, NSString * _Nonnull second, NSString * _Nonnull ms) {
        weakSelf.lab3.text = [NSString stringWithFormat:@"%@天%@:%@:%@.%@",day,hour,minute,second,ms];
    }];
    
    
    
    //高考倒计时 8641000000
    [LSTTimer addTimerForTime:30672000
                   identifier:@"gaokao"
                       handle:^(NSString * _Nonnull day,
                                NSString * _Nonnull hour,
                                NSString * _Nonnull minute,
                                NSString * _Nonnull second,
                                NSString * _Nonnull ms) {
        
        weakSelf.gLab1.text = day;
        weakSelf.gLab2.text = hour;
        weakSelf.gLab3.text = minute;
        weakSelf.gLab4.text = second;
        weakSelf.gLab5.text = ms;
        
    }];
    
    
    //今日剩余
    [LSTTimer addTimerForTime:86400
                   identifier:@"今日剩余"
                       handle:^(NSString * _Nonnull day,
                                NSString * _Nonnull hour,
                                NSString * _Nonnull minute,
                                NSString * _Nonnull second,
                                NSString * _Nonnull ms) {
        
        weakSelf.dayLab1.text = hour;
        weakSelf.dayLab2.text = minute;
        weakSelf.dayLab3.text = second;
        weakSelf.dayLab4.text = ms;
        
    }];
    
    //时分秒
    [LSTTimer addMinuteTimerForTime:7200 handle:^(NSString * _Nonnull day, NSString * _Nonnull hour, NSString * _Nonnull minute, NSString * _Nonnull second, NSString * _Nonnull ms) {
        weakSelf.hmsLab1.text = hour;
        weakSelf.hmsLab2.text = minute;
        weakSelf.hmsLab3.text = second;
        NSLog(@"一秒测试");
    }];
    
    //圆形
    [LSTTimer addMinuteTimerForTime:5 identifier:@"rLab1" handle:^(NSString * _Nonnull day, NSString * _Nonnull hour, NSString * _Nonnull minute, NSString * _Nonnull second, NSString * _Nonnull ms) {
        weakSelf.rLab1.text = [NSString stringWithFormat:@"%1d",second.intValue];
    }];
    [LSTTimer addMinuteTimerForTime:6 identifier:@"rLab2" handle:^(NSString * _Nonnull day, NSString * _Nonnull hour, NSString * _Nonnull minute, NSString * _Nonnull second, NSString * _Nonnull ms) {
        weakSelf.rLab2.text = [NSString stringWithFormat:@"%1d",second.intValue];;
    }];
    [LSTTimer addMinuteTimerForTime:7 identifier:@"rLab3" handle:^(NSString * _Nonnull day, NSString * _Nonnull hour, NSString * _Nonnull minute, NSString * _Nonnull second, NSString * _Nonnull ms) {
        weakSelf.rLab3.text = [NSString stringWithFormat:@"%1d",second.intValue];;
    }];
    [LSTTimer addMinuteTimerForTime:8 identifier:@"rLab4" handle:^(NSString * _Nonnull day, NSString * _Nonnull hour, NSString * _Nonnull minute, NSString * _Nonnull second, NSString * _Nonnull ms) {
        weakSelf.rLab4.text = [NSString stringWithFormat:@"%1d",second.intValue];;
    }];
    
    //跳过
    [LSTTimer addMinuteTimerForTime:5 identifier:@"jLab1" handle:^(NSString * _Nonnull day, NSString * _Nonnull hour, NSString * _Nonnull minute, NSString * _Nonnull second, NSString * _Nonnull ms) {
        weakSelf.jLab1.text = [NSString stringWithFormat:@"跳过 %1d",second.intValue];
    }];
    [LSTTimer addMinuteTimerForTime:8 identifier:@"jLab2" handle:^(NSString * _Nonnull day, NSString * _Nonnull hour, NSString * _Nonnull minute, NSString * _Nonnull second, NSString * _Nonnull ms) {
        weakSelf.jLab2.text = [NSString stringWithFormat:@"(%1d)跳过 ",second.intValue];
    }];
    [LSTTimer addMinuteTimerForTime:10 identifier:@"jLab3" handle:^(NSString * _Nonnull day, NSString * _Nonnull hour, NSString * _Nonnull minute, NSString * _Nonnull second, NSString * _Nonnull ms) {
        weakSelf.jLab3.text = [NSString stringWithFormat:@"跳过\n%1d",second.intValue];
    }];
    
    
    
 
    
}



#pragma mark - ***** Data Request 数据请求 *****


#pragma mark - ***** Other 其他 *****

- (IBAction)pauseAction:(UIButton *)sender {
    
    
    [LSTTimer pauseAllTimer];
    
}
- (IBAction)continueAction:(UIButton *)sender {
     [LSTTimer restartAllTimer];
}
- (IBAction)resetAction:(UIButton *)sender {
    [LSTTimer removeAllTimer];
    [self layoutSubViewUI];
    
}


#pragma mark - ***** Lazy Loading 懒加载 *****


@end
