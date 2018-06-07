//
//  TableViewCell.h
//  MultipleChoicesDemo
//
//  Created by 栗子 on 2018/6/5.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/     https://blog.csdn.net/qq_33608748. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UILabel *contentLB;

@property (nonatomic,strong)Model  *model;


@end
