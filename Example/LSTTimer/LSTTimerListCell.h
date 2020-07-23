//
//  LSTTimerListCell.h
//  LSTTimer_Example
//
//  Created by LoSenTrad on 2020/7/17.
//  Copyright © 2020 490790096@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LSTTimer.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSTTimerListCell : UITableViewCell


/** <#...#> */
@property (nonatomic, copy) NSString *timeStr;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;

@end

NS_ASSUME_NONNULL_END
