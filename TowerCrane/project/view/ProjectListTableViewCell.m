//
//  ProjectListTableViewCell.m
//  TowerCrane
//
//  Created by WangPF on 15/6/8.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "ProjectListTableViewCell.h"

@implementation ProjectListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.accessibilityElementsHidden = NO;
    
    
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setDataDic:(NSDictionary *)dataDic
{
    self.textLabel.text = dataDic[@"proName"];
    self.imageView.image = [UIImage imageNamed:@"projectCellHead"];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
