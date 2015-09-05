//
//  BreakRulesViewController.m
//  塔机监控
//
//  Created by WangPF on 15/5/19.
//  Copyright (c) 2015年 com.GongYou.TowerCrane. All rights reserved.
//

#import "BreakRulesViewController.h"
#import "BreakrulesTableViewCell.h"

@interface BreakRulesViewController ()<UITableViewDataSource,UITableViewDelegate,BreakRuleDelegate>

@end

@implementation BreakRulesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"cellidentify";
    BreakrulesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BreakrulesTableViewCell" owner:self options:nil] lastObject];
        cell.delegate = self;
    }
    
    return cell;
}

- (void)sendMessage
{
    
}
- (void)selectBreakRuleDetails:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"breakRuleDetail" sender:self];
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
