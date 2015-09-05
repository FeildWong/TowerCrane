//
//  CommenWebViewController.m
//  TowerCrane
//
//  Created by Feild Wong on 15/8/15.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "CommenWebViewController.h"

@interface CommenWebViewController ()<UIWebViewDelegate>
@property(nonatomic, strong) UIWebView *webView;
@property(nonatomic, strong)UIView *navView;
@property(nonatomic, strong)UILabel *titleLable;

@end

@implementation CommenWebViewController

- (id)init
{
    self = [super init];
    [self initUI];
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self configSubViews];
}

- (void)initUI
{
    [self addNavView];
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, _navView.bottom, APP_SCREEN_WIDTH, APP_SCREEN_HEIGHT - _navView.bottom - TabbarHeight)];
    _webView.delegate = self;
    
    [self.view addSubview:_webView];
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
    
    _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(backBtn.right + 10, 25, APP_SCREEN_WIDTH - (backBtn.right + 10) * 2, 30)];
    _titleLable.textAlignment = NSTextAlignmentCenter;
    _titleLable.textColor = [UIColor grayColor];
    _titleLable.text = @"网页";
    [_navView addSubview:_titleLable];
    [self.view addSubview:_navView];
}
- (void)configSubViews
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]];
    [_webView loadRequest:request];
    
    _titleLable.text = self.title;
}

- (void)pushToBack
{
    if ([self.navigationController respondsToSelector:@selector(popViewControllerAnimated:)]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

//--------------------------------------------------------
//webView delegate
//--------------------------------------------------------

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
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
