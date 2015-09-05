//
//  HomeFunctionButton.m
//  塔机监控
//
//  Created by WangPF on 15/5/10.
//  Copyright (c) 2015年 com.GongYou.TowerCrane. All rights reserved.
//

#import "HomeFunctionButton.h"
#define imageSide 50

@implementation HomeFunctionButton

- (void)awakeFromNib
{
    [self addSubViews];
}

- (void)addSubViews
{
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, imageSide, imageSide)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView];
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.right + 5, 13, APP_SCREEN_WIDTH/2 - 5 - imageSide,imageSide/2)];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:titleLabel];
    
    desLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.right + 5, titleLabel.bottom, APP_SCREEN_WIDTH/2 - 5 - imageSide,imageSide/2)];
    desLabel.textAlignment = NSTextAlignmentLeft;
    desLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:desLabel];
    
    numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.right - 20, imageView.bottom +5, APP_SCREEN_WIDTH/2 - 5 - imageSide - 50, imageSide)];
    numberLabel.textAlignment = NSTextAlignmentCenter;
    numberLabel.font = [UIFont systemFontOfSize:26];
    numberLabel.textColor = [UIColor redColor];
    [self addSubview:numberLabel];
    
    unitLabel = [[UILabel alloc] initWithFrame:CGRectMake(numberLabel.right +5, numberLabel.bottom - 20,30, 12)];
    unitLabel.font = [UIFont boldSystemFontOfSize:14];
    unitLabel.textColor = [UIColor blackColor];
    [self addSubview:unitLabel];
    
    
}

- (void)setButtonTitle:(NSString *)buttonTitle
{
    if (_buttonTitle != buttonTitle) {
        _buttonTitle = buttonTitle;
        titleLabel.text = buttonTitle;
    }
}
- (void)setButtonDes:(NSString *)buttonDes
{
    if (_buttonDes != buttonDes ) {
        _buttonDes = buttonDes;
        desLabel.text = buttonDes;
    }
}
- (void)setHeadImage:(UIImage *)headImage
{
    if (_headImage != headImage) {
        _headImage = headImage;
        imageView.image = headImage;
    }
}
- (void)setNumberStr:(NSString *)numberStr
{
    if (_numberStr != numberStr) {
        _numberStr = numberStr;
        numberLabel.text = numberStr;
    }
}
- (void)setUnitName:(NSString *)unitName
{
    if (_unitName != unitName) {
        _unitName = unitName;
        unitLabel.text = unitName;
    }
}

@end
