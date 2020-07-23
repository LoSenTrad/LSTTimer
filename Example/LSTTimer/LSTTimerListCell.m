//
//  LSTTimerListCell.m
//  LSTTimer_Example
//
//  Created by LoSenTrad on 2020/7/17.
//  Copyright © 2020 490790096@qq.com. All rights reserved.
//

#import "LSTTimerListCell.h"

@implementation LSTTimerListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initSubViews];
}

#pragma mark - ***** 初始化 *****


#pragma mark - ***** setter 设置器/数据处理 *****

- (void)setTimeStr:(NSString *)timeStr {
    _timeStr = timeStr;
    
    
}


#pragma mark - ***** setupUI 界面布局 *****

- (void)initSubViews {
    
    // 监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(timerChange) name:@"ListChangeNF" object:nil];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
}

#pragma mark - ***** other 其他 *****

- (void)timerChange {
    
    
    NSInteger timeMS = [LSTTimer getTimeIntervalForIdentifier:@"listTimer"];
    NSInteger resTimeMS = self.timeStr.integerValue*1000 -timeMS;
    NSLog(@"%zd",timeMS);
    [LSTTimer formatDateForTime:resTimeMS handle:^(NSString * _Nonnull day, NSString * _Nonnull hour, NSString * _Nonnull minute, NSString * _Nonnull second, NSString * _Nonnull ms) {
        self.timeLab.text = [NSString stringWithFormat:@"%@天%@:%@:%@.%@",day,hour,minute,second,ms];
    }];
    
}

#pragma mark - ***** Lazy Loading 懒加载 *****

@end
