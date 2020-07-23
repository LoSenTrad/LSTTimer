//
//  LSTTimerDiskVC.m
//  LSTTimer_Example
//
//  Created by LoSenTrad on 2020/7/18.
//  Copyright © 2020 490790096@qq.com. All rights reserved.
//

#import "LSTTimerDiskVC.h"
#import <LSTTimer.h>

@interface LSTTimerDiskVC ()
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;

@end

@implementation LSTTimerDiskVC

#pragma mark - ***** Controller Life Cycle 控制器生命周期 *****

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self layoutSubViewUI];
 
}



#pragma mark - ***** setupUI 界面布局 *****

- (void)layoutSubViewUI {
    self.title = @"硬盘倒计时";
    NSInteger timeMS = [LSTTimer getTimeIntervalForIdentifier:@"DISK"];
    if (timeMS>0) {
        [self open];
    }
}


#pragma mark - ***** Data Request 数据请求 *****


#pragma mark - ***** Other 其他 *****

- (IBAction)sendSMSAction:(UIButton *)sender {
    if (self.sendBtn.enabled) {
        self.sendBtn.enabled = NO;
        [self open];
    }
    
}

- (void)open {
    
    
    [LSTTimer addDiskMinuteTimerForTime:20 identifier:@"DISK" handle:^(NSString * _Nonnull day, NSString * _Nonnull hour, NSString * _Nonnull minute, NSString * _Nonnull second, NSString * _Nonnull ms) {
        NSString *str = [NSString stringWithFormat:@"(%1d)s",second.intValue];
        [self.sendBtn setTitle:str forState:UIControlStateNormal];
    } finish:^(NSString * _Nonnull identifier) {
        self.sendBtn.enabled = YES;
        [self.sendBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    } pause:^(NSString * _Nonnull identifier) {
        
    }];
}

#pragma mark - ***** Lazy Loading 懒加载 *****




@end
