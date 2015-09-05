//
//  DeviceListTableViewCell.m
//  TowerCrane
//
//  Created by WangPF on 15/6/8.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "DeviceListTableViewCell.h"

@implementation DeviceListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.accessibilityElementsHidden = NO;
    
    
    return self;
}

- (void)awakeFromNib {
    
}

- (void)setDataDic:(NSDictionary *)dataDic
{
    self.textLabel.text = dataDic[@"deviceNum"];
    
    if ([dataDic[@"isonline"] isEqualToString:@"在线"]) {
        self.imageView.image = [UIImage imageNamed:@"deviceListH"];

    }else{
        self.imageView.image = [UIImage imageNamed:@"deviceList"];

    }
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
