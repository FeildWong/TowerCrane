//
//  DeviceListTableViewCell.h
//  TowerCrane
//
//  Created by WangPF on 15/6/8.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceListTableViewCell : UITableViewCell


@property(nonatomic, strong) NSDictionary *dataDic;
@property(nonatomic, assign) BOOL isOnline;
@property(nonatomic, copy) NSString *title;


@end
