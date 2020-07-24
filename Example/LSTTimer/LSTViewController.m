//
//  LSTViewController.m
//  LSTTimer
//
//  Created by 490790096@qq.com on 07/13/2020.
//  Copyright (c) 2020 490790096@qq.com. All rights reserved.
//

#import "LSTViewController.h"
#import <LSTTimer.h>
#import <Masonry.h>
#import <UIView+LSTView.h>
#import "LSTTimerDemoVC.h"
#import "LSTTimerListVC.h"
#import "LSTTimerRAMVC.h"
#import "LSTTimerDiskVC.h"

@interface LSTViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

/** 表 */
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation LSTViewController

#pragma mark - ***** Controller Life Cycle 控制器生命周期 *****

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self layoutSubViewUI];
    
    self.title = @"LSTTimer";
    //10000
    //1000 --- 55%
    //100 --- 47%
    //10 --- 8%
    for (int i = 0; i<100; i++) {
        //一天10秒 = 86410秒
        [LSTTimer addTimerForTime:86410 handle:^(NSString * _Nonnull day, NSString * _Nonnull hour, NSString * _Nonnull minute, NSString * _Nonnull second, NSString * _Nonnull ms) {
            
        }];
        
    }

}

#pragma mark - ***** setupUI 界面布局 *****

- (void)layoutSubViewUI {
    
    [self.view addSubview:self.tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(LSTNavBarHeight());
        make.right.left.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
}




#pragma mark - ***** Data Request 数据请求 *****


#pragma mark - ***** Other 其他 *****


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = @"倒计时示例";
        }
            break;
        case 1:
        {
            cell.textLabel.text = @"列表倒计时";
        }
            break;
        case 2:
        {
            cell.textLabel.text = @"全局内存倒计时";
        }
            break;
        case 3:
        {
            cell.textLabel.text = @"持久化倒计时(硬盘计时)";
        }
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    });
    
    if (indexPath.row == 0) {
        LSTTimerDemoVC *xibVC = [[LSTTimerDemoVC alloc] initWithNibName:@"LSTTimerDemoVC" bundle:nil];
        [self.navigationController pushViewController:xibVC animated:YES];
    }
    
    if (indexPath.row == 1) {
        LSTTimerListVC *xibVC = [[LSTTimerListVC alloc] init];
        [self.navigationController pushViewController:xibVC animated:YES];
    }
    
    if (indexPath.row == 2) {
       LSTTimerRAMVC *xibVC = [[LSTTimerRAMVC alloc] initWithNibName:@"LSTTimerRAMVC" bundle:nil];
        [self.navigationController pushViewController:xibVC animated:YES];
    }
    
    if (indexPath.row == 3) {
        LSTTimerDiskVC *xibVC = [[LSTTimerDiskVC alloc] initWithNibName:@"LSTTimerDiskVC" bundle:nil];
        [self.navigationController pushViewController:xibVC animated:YES];
    }
}

#pragma mark - ***** Lazy Loading 懒加载 *****

- (UITableView *)tableView {
    if(_tableView) return _tableView;
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 44;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    return _tableView;
}


@end
