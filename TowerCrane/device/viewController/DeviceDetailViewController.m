//
//  DeviceDetailViewController.m
//  TowerCrane
//
//  Created by WangPF on 15/6/3.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "DeviceDetailViewController.h"
#import "DeviceDetailModel.h"

@interface DeviceDetailViewController ()

@end

@implementation DeviceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self addNavView];
    [self addTopTabs];
    
}
- (void)addNavView
{
    _navView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_SCREEN_WIDTH, 64)];
    _navView.backgroundColor = BaseNavColor;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 25, 30, 30);
    [backBtn setImage:[UIImage imageNamed:@"backBtn.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(pushToBack) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:backBtn];
    
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(backBtn.right + 10, 25, APP_SCREEN_WIDTH - (backBtn.right + 10) * 2, 30)];
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.text = @"设备信息";
    [_navView addSubview:titleLable];
    [self.view addSubview:_navView];
}
- (void)addTopTabs
{
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"基本信息",@"实时监控",@"实时数据",@"历史数据",@"报警数据"]];
    [segmentControl addTarget:self action:@selector(changeTopTabsIndex:) forControlEvents:UIControlEventValueChanged];
    segmentControl.frame =CGRectMake(0, _navView.bottom, APP_SCREEN_WIDTH, 44);
    segmentControl.backgroundColor = BaseNavColor;
    segmentControl.selectedSegmentIndex = 0;
    [self.view addSubview:segmentControl];
}


- (void)changeTopTabsIndex:(id)sender
{
    UISegmentedControl *segmentControl = sender;
    switch (segmentControl.selectedSegmentIndex) {
        case 0:
            [_paramDic setObject:@"基本" forKey:@"m"];
            [self loadDataDic:_paramDic];
            break;
        case 1:
            NSLog(@"展示实时监控");

            break;
        case 2:
            NSLog(@"展示实时数据");

            break;
        case 3:
            NSLog(@"展示历史数据");

            break;
        case 4:
            NSLog(@"展示报警数据");

            break;
            
        default:
            break;
    }
}

- (void)loadDataDic:(NSMutableDictionary *)paramDic
{
    [DeviceDetailModel deviceDetailRequestWithName:paramDic finifed:^(NSDictionary *dataDic) {
       
        
    }];
}

- (void)pushToBack
{
    if ([self.navigationController respondsToSelector:@selector(popViewControllerAnimated:)]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
