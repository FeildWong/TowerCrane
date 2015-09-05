//
//  BannerScrollView.h
//  eLife
//
//  Created by WangPF on 15/3/16.
//  Copyright (c) 2015年 刘鹤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannerScrollView : UIView<UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView *scrollImageView;
@property(nonatomic, strong) UIPageControl *pageControl;

@property(nonatomic, assign) NSInteger  numberOfPages;
@property(nonatomic)  NSInteger currentPage;
@property(nonatomic, retain) NSMutableArray *imageViews;
@property(nonatomic, strong) NSArray *imageUrlArr;
@property BOOL pageControlUsed;

@property (nonatomic,strong) NSTimer *timer; // Don't forget set valid when not in front

@property (nonatomic , copy) void (^TapActionBlock)(NSInteger pageIndex);

@end
