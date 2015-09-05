//
//  LoginViewController.m
//  test
//
//  Created by WangPF on 15/4/26.
//  Copyright (c) 2015年 com.GongYou.TowerCrane. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITextFieldDelegate,UIAlertViewDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    self.view.backgroundColor = TopicColor;
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.hidden = YES;
    self.passWord.secureTextEntry = YES;
    self.passWord.clearsOnBeginEditing = YES;
    self.userName.clearsOnBeginEditing = YES;
    
    self.LogoImage.image = [UIImage imageNamed:@"appLogo.png"];
    self.passWord.delegate = self;
    self.userName.delegate = self;
    
    //添加通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotificationOfLogin:) name:LoginSuccessNotification object:nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect textFrame = textField.frame;
//    textFrame.origin.y - 30
    [UIView animateWithDuration:0.35 animations:^{
        [self.view setFrame:CGRectMake(self.view.frame.origin.x, - textFrame.origin.y + 80, self.view.frame.size.width, self.view.frame.size.height)];
    }];
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.userName) {
        
        [textField resignFirstResponder];
        [self.passWord becomeFirstResponder];
        
    }else if(textField == self.passWord){
        
        [textField resignFirstResponder];
        [UIView animateWithDuration:0.1 animations:^{
            [self.view setFrame:CGRectMake(self.view.frame.origin.x, 0, self.view.frame.size.width, self.view.frame.size.height)];
        }];
    }
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginAction:(id)sender {
    
    [self.userName resignFirstResponder];
    [self.passWord resignFirstResponder];
    [UIView animateWithDuration:0.1 animations:^{
        [self.view setFrame:CGRectMake(self.view.frame.origin.x, 0, self.view.frame.size.width, self.view.frame.size.height)];
    }];
    
    [LoginModel LoginRequestWithName:self.userName.text pass:self.passWord.text];
    
}

- (void)getNotificationOfLogin:(id)message
{
    NSNotification *notification = message;
    NSString *showMessage = notification.userInfo[@"message"];
    if ([showMessage isEqualToString:@""]) {
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
        
    }else{
        
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:showMessage delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        
        [alertView show];
    }
}
//--------------------------------------------------------
//alertView delegate
//--------------------------------------------------------

@end
