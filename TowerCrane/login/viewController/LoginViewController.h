//
//  LoginViewController.h
//  test
//
//  Created by WangPF on 15/4/26.
//  Copyright (c) 2015年 com.GongYou.TowerCrane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "LoginModel.h"

@interface LoginViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIImageView *LogoImage;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
- (IBAction)loginAction:(id)sender;

@end
