//
//  PushTabsView.h
//  TowerCrane
//
//  Created by WangPF on 15/6/4.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PushTabsDelegate <NSObject>

- (void)didSelectTabAtIndex:(NSIndexPath *)indexPath;

@end

@interface PushTabsView : UIView<UITableViewDataSource,UITableViewDelegate>
//选项卡的tabs
@property(nonatomic, strong) NSArray *tabsArr;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, assign) id<PushTabsDelegate> delegate;
@property(nonatomic, assign) BOOL isShow;


- (id)initWithTabsArr:(NSArray *)tabsArr withFram:(CGRect)frame;

- (void)showTabsInView:(UIView *)superView;
- (void)hidenTabs;


@end
