//
//  CompanyViewController.m
//  TowerCrane
//
//  Created by WangPF on 15/6/2.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "CompanyViewController.h"

@interface CompanyViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) UIView *navView;
@property(nonatomic, strong) UITableView *categoryTabs;
@property(nonatomic, strong) UITableView *tableView;


@end

@implementation CompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavView:nil];
    [self addCategoryTabs:nil];
    [self addTableView:nil];
    // Do any additional setup after loading the view.
}

- (void)addNavView:(NSSet *)objects
{
    _navView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_SCREEN_WIDTH, 64)];
    _navView.backgroundColor = BaseNavColor;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 25, _canCallBack? 30:0 , 30);
    [backBtn setImage:[UIImage imageNamed:@"backBtn.png"] forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(pushToBack) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:backBtn];
    
    //添加searchBar
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(backBtn.right + 5, 25, APP_SCREEN_WIDTH - 60 - backBtn.width, 34)];
    searchBar.backgroundImage = [UIImage imageNamed:@"clearColorImage.png"];
    searchBar.placeholder = @"请输入企业名";
    
    [_navView addSubview:searchBar];
    [self.view addSubview:_navView];
}
- (void)addCategoryTabs:(NSSet *)objects
{
    _categoryTabs = [[UITableView alloc] initWithFrame:CGRectMake( 0, _navView.bottom, 70,APP_SCREEN_HEIGHT - _navView.height - TabbarHeight) style:UITableViewStylePlain];
    _categoryTabs.layer.borderWidth = 1;
    _categoryTabs.layer.borderColor = [UIColor grayColor].CGColor;
    _categoryTabs.delegate = self;
    _categoryTabs.dataSource = self;
    [self.view addSubview:_categoryTabs];
}
- (void)addTableView:(NSSet *)objects
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(_categoryTabs.right, _navView.bottom, APP_SCREEN_WIDTH - _categoryTabs.width, _categoryTabs.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma -mark tableViewDelegate

#pragma -mark tableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([tableView isEqual:_categoryTabs]) {
        
        static NSString *cellTabIdentify = @"deviceTabDetailCellIdentify";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellTabIdentify];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellTabIdentify];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        cell.textLabel.text = @"建筑";
        return cell;
        
    }else{
        static NSString *cellIdentify = @"deviceDetailCellIdentify";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
        cell.textLabel.text = @"万兴建筑集团有限公司";
        return cell;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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
