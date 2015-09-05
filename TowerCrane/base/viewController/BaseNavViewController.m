//
//  BaseNavViewController.m
//  塔机监控
//
//  Created by WangPF on 15/4/26.
//  Copyright (c) 2015年 com.GongYou.TowerCrane. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = TopicColor;
    self.navigationBar.hidden = YES;
    __weak typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
    
}


- (void)viewDidAppear:(BOOL)animated
{
//    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"login"];
//    [self performSegueWithIdentifier:@"PresentLogin" sender:self];
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
