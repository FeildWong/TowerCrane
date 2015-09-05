//
//  PushTabsView.m
//  TowerCrane
//
//  Created by WangPF on 15/6/4.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "PushTabsView.h"

@implementation PushTabsView

- (id)initWithTabsArr:(NSArray *)tabsArr withFram:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor blueColor];
    _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self addSubview:_tableView];
    
    self.tabsArr = tabsArr;
    self.isShow = NO;
    
    return self;
}

- (void)setTabsArr:(NSArray *)tabsArr
{
    if (_tabsArr != tabsArr) {
        _tabsArr = tabsArr;
        
        [_tableView reloadData];
        
    }
}

#pragma mark -tableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self.delegate respondsToSelector:@selector(didSelectTabAtIndex:)]) {
        [self.delegate didSelectTabAtIndex:indexPath];
    }
    [self hidenTabs];
}

#pragma mark -tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tabsArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"tabsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = _tabsArr[indexPath.row];
    
    return cell;
}


- (void)showTabsInView:(UIView *)superView
{
    if (_isShow == NO) {
        [superView addSubview:self];
    }else{
        
    }
    _isShow = YES;
    
}
- (void)hidenTabs
{
    _isShow = NO;
    [self removeFromSuperview];
}




@end
