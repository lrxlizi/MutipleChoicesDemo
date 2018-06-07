//
//  TableViewCell.m
//  MultipleChoicesDemo
//
//  Created by 栗子 on 2018/6/5.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/     https://blog.csdn.net/qq_33608748. All rights reserved.
//

#import "TableViewCell.h"
#import "Model.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //点击整个cell时
    self.selectBtn.userInteractionEnabled = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(Model *)model{
    
    _model = model;
    self.contentLB.text = [NSString stringWithFormat:@"%@",model.text];
    if (model.isSelected) {
        [self.selectBtn setBackgroundImage:[UIImage imageNamed:@"selected_btn"] forState:UIControlStateNormal];
    } else {
        [self.selectBtn setBackgroundImage:[UIImage imageNamed:@"unselected_btn"] forState:UIControlStateNormal];
    }
    
}


@end
