//
//  ProjectViewController.h
//  TowerCrane
//
//  Created by WangPF on 15/6/2.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "BaseViewController.h"

@interface ProjectViewController : BaseViewController

@property(nonatomic, assign) BOOL canCallBack;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIView *navView;
@property(nonatomic, strong) NSMutableDictionary *dataDic;


@end
