//
//  BreakrulesTableViewCell.m
//  塔机监控
//
//  Created by WangPF on 15/5/19.
//  Copyright (c) 2015年 com.GongYou.TowerCrane. All rights reserved.
//

#import "BreakrulesTableViewCell.h"

@implementation BreakrulesTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)breakRuleAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(selectBreakRuleDetails:)]) {
        [self.delegate selectBreakRuleDetails:[NSIndexPath indexPathWithIndex:1]];
    }
}
- (IBAction)sendMessageAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(sendMessage)]) {
        [self.delegate sendMessage];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
