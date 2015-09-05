//
//  HomeFunctionButton.h
//  塔机监控
//
//  Created by WangPF on 15/5/10.
//  Copyright (c) 2015年 com.GongYou.TowerCrane. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeFunctionButtonDelegate <NSObject>

- (void)homeFunctionButtonBecomeActive:(NSInteger)index;

@end

@interface HomeFunctionButton : UIButton
{
    UILabel *titleLabel;
    UILabel *desLabel;
    UIImageView *imageView;
    UILabel *numberLabel;
    UILabel *unitLabel;
}
@property(nonatomic, assign)id<HomeFunctionButtonDelegate> homeFunctionDelegate;
@property(nonatomic, assign)NSInteger index;

@property(nonatomic, copy)NSString *buttonTitle;
@property(nonatomic, copy)NSString *buttonDes;
@property(nonatomic, strong)UIImage *headImage;
@property(nonatomic, copy)NSString *numberStr;
@property(nonatomic, copy)NSString *unitName;

@end
