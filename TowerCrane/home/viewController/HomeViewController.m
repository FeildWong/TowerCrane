//
//  HomeViewController.m
//  test
//
//  Created by WangPF on 15/4/26.
//  Copyright (c) 2015年 com.GongYou.TowerCrane. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "HomeHeadModel.h"
#import "UIImageView+WebCache.h"
#import "CommenWebViewController.h"
#define Duration 0.2

@interface HomeViewController ()
{
    BOOL contain;
    CGPoint startPoint;
    CGPoint originPoint;
}

@property (strong , nonatomic) NSMutableArray *itemArray;
@property (strong , nonatomic) NSMutableArray *indexArr;
@property (strong , nonatomic) NSMutableDictionary *homeDataDic;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BaseNavColor;
    [self configBannerView];
    
    [self configHomeButton];
    
    [self loadData];
}
- (void)loadData
{
    [HomeHeadModel HomeHeadRequestWithName:[LoginModel getUser] finifed:^(NSDictionary *dataDic) {
        
        self.homeDataDic = [NSMutableDictionary dictionaryWithDictionary:dataDic[@"datas"]];
        
    }];
}

- (void)setHomeDataDic:(NSMutableDictionary *)homeDataDic
{
    if (self.homeDataDic != homeDataDic) {
        _homeDataDic = homeDataDic;
    }
    
    NSMutableArray *imageUrlArr = [NSMutableArray array];
    for (NSDictionary * dic in homeDataDic[@"advList"]) {
        [imageUrlArr addObject:dic[@"advImgUrl"]];
    }
    _bannerScrollView.imageUrlArr = imageUrlArr;
    
    
    NSArray *titleArray = @[@"新增设备",@"设备在线",@"报警信息",@"违章信息",@"危险工地",@"电子地图"];
    NSArray *unitArray = @[@"／台",@"／台",@"／次",@"／次",@"／处",@"电子地图"];
    NSArray *numArray = @[_homeDataDic[@"news"],[NSString stringWithFormat:@"%@/%@",_homeDataDic[@"onlineCount"],_homeDataDic[@"count"]],_homeDataDic[@"alarmProCount"],_homeDataDic[@"breakCount"],_homeDataDic[@"alarmCount"],@""];
    
    for (NSInteger i = 0;i< self.itemArray.count ; i++)
    {
        NSNumber *indexNum = self.indexArr[i];
        HomeFunctionButton *btn = self.itemArray[i];
        [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.index = [indexNum integerValue];


        btn.buttonTitle = titleArray[[indexNum integerValue]];
        btn.buttonDes = titleArray[[indexNum integerValue] ];
        
        btn.numberStr = numArray[[indexNum integerValue]];
        
        btn.unitName = unitArray[[indexNum integerValue]];
    }
    
}

- (void)configBannerView
{
    _bannerScrollView.scrollImageView.scrollsToTop = NO;
    
    __block HomeViewController *weakSelf = self;
    _bannerScrollView.TapActionBlock = ^(NSInteger pageIndex){
        
        CommenWebViewController *commenVC = [[CommenWebViewController alloc] init];
        commenVC.title = _homeDataDic[@"advList"][pageIndex][@"advWords"];
        commenVC.urlString =[NSString stringWithFormat:@"http://%@",_homeDataDic[@"advList"][pageIndex][@"advClickUrl"]];
        
        [weakSelf.navigationController pushViewController:commenVC animated:YES];
        NSLog(@"%@",_homeDataDic[@"advList"][pageIndex]);
        
    };

}

- (void)configHomeButton
{
    self.itemArray = [NSMutableArray arrayWithObjects:_index1Button,_index2Button,_index3Button,_index4Button,_index5Button,_index6Button, nil];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"homeButton" ofType:@"plist"];
    self.indexArr =[[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    self.bgScrollView.height = self.view.height - 49;
    
    NSArray *titleArray = @[@"新增设备",@"设备在线",@"报警信息",@"违章信息",@"危险工地",@"电子地图"];
    NSArray *imageArr = @[@"newAddDeviceButton.png",@"onLineDeviceButton.png",@"alamMessageButton.png",@"outRuleMessageButton.png",@"dangerouceGroundButton.png",@"eMapButton.png"];
    
    for (NSInteger i = 0;i< self.itemArray.count ; i++)
    {
        NSNumber *indexNum = self.indexArr[i];
        HomeFunctionButton *btn = self.itemArray[i];
        [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.index = [indexNum integerValue];
        btn.backgroundColor = HomeButtonBg;
        btn.buttonTitle = titleArray[[indexNum integerValue]];
        btn.buttonDes =titleArray[[indexNum integerValue]];
        btn.numberStr =titleArray[[indexNum integerValue]];
        btn.unitName =titleArray[[indexNum integerValue]];
        btn.headImage = [UIImage imageNamed:imageArr[[indexNum integerValue]]];
    }
}


- (void)viewWillAppear:(BOOL)animated
{

    if (![LoginModel isLogin]) {
        [self.navigationController performSegueWithIdentifier:@"presentLogin" sender:self];
    }else{
        [self loadData];
    }
    self.itemArray = [NSMutableArray arrayWithObjects:_index1Button,_index2Button,_index3Button,_index4Button,_index5Button,_index6Button, nil];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"homeButton" ofType:@"plist"];
    self.indexArr =[[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    NSLog(@"indexArr%@",self.indexArr);

    NSArray *titleArray = @[@"新增设备",@"设备在线",@"报警信息",@"违章信息",@"危险工地",@"电子地图"];

    NSArray *unitArray = @[@"／台",@"／台",@"／次",@"／次",@"／处",@"电子地图"];

    
    for (NSInteger i = 0;i< self.itemArray.count ; i++)
    {
        NSNumber *indexNum = self.indexArr[i];
        HomeFunctionButton *btn = self.itemArray[i];
        [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.index = [indexNum integerValue];
        btn.buttonTitle = titleArray[[indexNum integerValue]];
        btn.buttonDes = titleArray[[indexNum integerValue] ];
        
        btn.numberStr =titleArray[[indexNum integerValue]];

        btn.unitName = unitArray[[indexNum integerValue]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//buttonClick
- (void)buttonClickAction:(HomeFunctionButton *)btn
{
    switch (btn.index) {
        case 0:
            [self performSegueWithIdentifier:@"addNewDevice" sender:btn];

            break;
        case 1:
            [self performSegueWithIdentifier:@"onlineDevice" sender:btn];

            break;
        case 2:
            [self performSegueWithIdentifier:@"breakRule" sender:btn];

            break;
        case 3:
            [self performSegueWithIdentifier:@"outLineTime" sender:btn];
            break;
        case 4:
            [self performSegueWithIdentifier:@"companyMessage" sender:btn];

            break;
            
        default:
            break;
    }

}

- (NSInteger)indexOfPoint:(CGPoint)point withButton:(UIButton *)btn
{
    for (NSInteger i = 0;i<_itemArray.count;i++)
    {
         NSNumber *indexNum = self.indexArr[i];
        UIButton *button = _itemArray[[indexNum integerValue]];
        if (button != btn)
        {
            if (CGRectContainsPoint(button.frame, point))
            {
                return i;
            }
        }
    }
    return -1;
}



#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [segue destinationViewController];
}


@end
