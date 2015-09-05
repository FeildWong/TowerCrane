//
//  DeviceTableViewController.m
//  TowerCrane
//
//  Created by WangPF on 15/6/2.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "DeviceViewController.h"
#import "DeviceDetailViewController.h"
#import "DeviceListTableViewCell.h"

#import "DeviceModel.h"
#import "PushTabsView.h"

#import "MJRefresh.h"

@interface DeviceViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    PushTabsView *pushTabsView;
}


@end

@implementation DeviceViewController

- (id)init
{
    self = [super init];
    self.canCallBack = NO;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavView];
    [self addTableView:nil];
    
    [self loadData:@{}];

}

- (void)loadData:(NSDictionary *)paramDic
{
    [DeviceModel deviceListRequestWithName:paramDic finifed:^(NSDictionary *dataDic) {
        self.dataDic = [NSMutableDictionary dictionaryWithDictionary:dataDic];
    }];
}

- (void)setDataDic:(NSMutableDictionary *)dataDic
{
    if (_dataDic != dataDic) {
        _dataDic = dataDic;
    }
    
    [_tableView reloadData];
    
}

//添加nav视图
- (void)addNavView
{
    _navView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_SCREEN_WIDTH, 64)];
    _navView.backgroundColor = BaseNavColor;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 25, _canCallBack? 30:0 , 30);
    [backBtn setImage:[UIImage imageNamed:@"backBtn.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(pushToBack) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:backBtn];
    
    //添加searchBar
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(backBtn.right + 5, 25, APP_SCREEN_WIDTH - 60 - backBtn.width, 34)];
    searchBar.backgroundImage = [UIImage imageNamed:@"clearColorImage.png"];
    searchBar.placeholder = @"请输入黑匣子编号";
    
    [_navView addSubview:searchBar];
    //添加tabsButton
    UIButton *tabsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tabsButton setImage:[UIImage imageNamed:@"deviceCategory.png"] forState:UIControlStateNormal];
    tabsButton.frame = CGRectMake(searchBar.right + 5, 25, 34, 34);
    [tabsButton addTarget:self action:@selector(showTabs:) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:tabsButton];
    
    [self.view addSubview:_navView];
}

- (void)pushToBack
{
    if ([self.navigationController respondsToSelector:@selector(popViewControllerAnimated:)]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)showTabs:(id)sender
{
    UIButton *button = sender;
    NSArray *tabsArr = @[@"1",@"2",@"3"];
    CGRect rect = CGRectMake(button.left, button.bottom, button.width, tabsArr.count > 5? 5:tabsArr.count * 40);
    if (!pushTabsView|| pushTabsView.isShow == NO) {
        pushTabsView = [[PushTabsView alloc] initWithTabsArr:tabsArr withFram:rect];
        [pushTabsView showTabsInView:self.view];

    }else if(pushTabsView.isShow == NO){
        [pushTabsView showTabsInView:self.view];

    }else{
        [pushTabsView hidenTabs];

    }
}

//添加tableView
- (void)addTableView:(NSSet *)objects
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _navView.bottom, APP_SCREEN_WIDTH, APP_SCREEN_HEIGHT - 64 - 49) style:UITableViewStylePlain];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    __block DeviceViewController *weakSelf = self;
    
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        NSLog(@"refresh");
        
        double delayInSeconds = 2.0;
        dispatch_time_t end_time = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(end_time, dispatch_get_main_queue(), ^{
            NSLog(@"加载超时!!!");
            [weakSelf.tableView.header endRefreshing];
        });
    }];
    
    [self.tableView addLegendFooterWithRefreshingBlock:^{
        NSLog(@"loadMore");
        
        double delayInSeconds = 2.0;
        dispatch_time_t end_time = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(end_time, dispatch_get_main_queue(), ^{
            NSLog(@"加载超时!!!");
            [weakSelf.tableView.footer endRefreshing];
        });
    }];
    
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_dataDic[@"datas"] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentify = @"deviceCellIdentify";
    DeviceListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell == nil) {
        cell = [[DeviceListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    }
    cell.dataDic = _dataDic[@"datas"][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DeviceDetailViewController *deviceDetailVC = [[DeviceDetailViewController alloc] init];
    deviceDetailVC.title = @"设备详情";
    deviceDetailVC.paramDic = [NSMutableDictionary dictionaryWithDictionary:_dataDic[@"datas"][indexPath.row]];
    [self.navigationController pushViewController:deviceDetailVC animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
