//
//  ProjectViewController.m
//  TowerCrane
//
//  Created by WangPF on 15/6/2.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "ProjectViewController.h"
#import "ProjectDetailViewController.h"
#import "ProjectListTableViewCell.h"
#import "MJRefresh.h"
#import "ProjectListModel.h"

@interface ProjectViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavView];
    [self addTableView:nil];
    
    [self loadDataDic];
    
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
    searchBar.placeholder = @"请输入项目名";
    
    [_navView addSubview:searchBar];
    //添加tabsButton
//    UIButton *tabsButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [tabsButton setImage:[UIImage imageNamed:@"deviceCategory.png"] forState:UIControlStateNormal];
//    tabsButton.frame = CGRectMake(searchBar.right + 5, 25, 34, 34);
//    [tabsButton addTarget:self action:@selector(showTabs:) forControlEvents:UIControlEventTouchUpInside];
//    [_navView addSubview:tabsButton];
    
    [self.view addSubview:_navView];
}
- (void)pushToBack
{
    if ([self.navigationController respondsToSelector:@selector(popViewControllerAnimated:)]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)addTableView:(NSSet *)objects
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _navView.bottom, APP_SCREEN_WIDTH, APP_SCREEN_HEIGHT - 64 - 49) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    __block ProjectViewController *weakSelf = self;

    
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

- (void)loadDataDic
{
    [ProjectListModel projectListRequestWithName:@{} finifed:^(NSDictionary *dataDic) {
        self.dataDic = [NSMutableDictionary dictionaryWithDictionary:dataDic];
    }];
}

- (void)setDataDic:(NSMutableDictionary *)dataDic
{
    if (_dataDic != dataDic) {
        _dataDic = dataDic;
    }
    
    [self.tableView reloadData];
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
    
    static NSString *cellIdentify = @"deviceDetailCellIdentify";
    ProjectListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell == nil) {
        cell = [[ProjectListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    }
    cell.dataDic = _dataDic[@"datas"][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProjectDetailViewController *projectDetailVC= [[ProjectDetailViewController alloc] init];
    [self.navigationController pushViewController:projectDetailVC animated:YES];
}
@end
