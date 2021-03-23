//
//  LSTTimerListVC.m
//  LSTTimer_Example
//
//  Created by LoSenTrad on 2020/7/15.
//  Copyright © 2020 490790096@qq.com. All rights reserved.
//

#import "LSTTimerListVC.h"
#import <Masonry.h>
#import <UIView+LSTView.h>
#import "LSTTimerListCell.h"


@interface LSTTimerListVC ()
<
UITableViewDelegate,
UITableViewDataSource
>
/** 表 */
@property (nonatomic,strong) UITableView *tableView;

/** 数据源 */
@property (nonatomic,strong) NSMutableArray *dataMarr;


@end

@implementation LSTTimerListVC

#pragma mark - ***** Controller Life Cycle 控制器生命周期 *****

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self layoutSubViewUI];
    self.title = @"列表倒计时";
   
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"添加数据" style:UIBarButtonItemStylePlain target:self action:@selector(test)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)test {
    [_dataMarr addObject:@"86400"];
    [_dataMarr addObject:@"20002121"];
    [_dataMarr addObject:@"86400"];
    [_dataMarr addObject:@"262121"];
    [_dataMarr addObject:@"96400"];
    [_dataMarr addObject:@"2602121"];
    [self.tableView reloadData];
}

- (void)dealloc {
    [LSTTimer removeAllTimer];
}



#pragma mark - ***** setupUI 界面布局 *****

- (void)layoutSubViewUI {
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self.view addSubview:self.tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(LSTNavBarHeight());
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
     
    
    
    
    
    
    [LSTTimer addTimerForTime:3600 identifier:@"listTimer" handle:nil];//对应LSTTimerSecondChangeNFTypeMS(毫秒api)
//    [LSTTimer addMinuteTimerForTime:3600 identifier:@"listTimer" handle:nil];//对应LSTTimerSecondChangeNFTypeSecond(秒api)
    //配置通知发送和计时任务绑定 没有配置 就不会有通知发送
    [LSTTimer setNotificationForName:@"ListChangeNF" identifier:@"listTimer" changeNFType:LSTTimerSecondChangeNFTypeMS];
}



#pragma mark - ***** Data Request 数据请求 *****


#pragma mark - ***** Other 其他 *****

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataMarr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSTTimerListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[LSTTimerListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.timeStr = self.dataMarr[indexPath.row];
    return cell;
}

#pragma mark - ***** Lazy Loading 懒加载 *****

- (UITableView *)tableView {
    if(_tableView) return _tableView;
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 50;
    [_tableView registerNib:[UINib nibWithNibName:@"LSTTimerListCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    return _tableView;
}

- (NSMutableArray *)dataMarr {
    if(_dataMarr) return _dataMarr;
    _dataMarr = [NSMutableArray array];
    [_dataMarr addObject:@"106400"];
    [_dataMarr addObject:@"4000"];
    return _dataMarr;
}



@end
