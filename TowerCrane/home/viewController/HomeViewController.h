//
//  HomeViewController.h
//  test
//
//  Created by WangPF on 15/4/26.
//  Copyright (c) 2015年 com.GongYou.TowerCrane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "HomeFunctionButton.h"
#import "BannerScrollView.h"

@interface HomeViewController :BaseViewController

@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
@property (weak, nonatomic) IBOutlet BannerScrollView *bannerScrollView;
@property (nonatomic, assign)CGRect originalRect;     //之前的frame
@property (nonatomic, assign)CGRect newRect;           //新的frame
@property (weak, nonatomic) IBOutlet HomeFunctionButton *index1Button;
@property (weak, nonatomic) IBOutlet HomeFunctionButton *index2Button;
@property (weak, nonatomic) IBOutlet HomeFunctionButton *index3Button;
@property (weak, nonatomic) IBOutlet HomeFunctionButton *index4Button;
@property (weak, nonatomic) IBOutlet HomeFunctionButton *index5Button;
@property (weak, nonatomic) IBOutlet HomeFunctionButton *index6Button;

@end
