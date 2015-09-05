//
//  LoginModel.m
//  TowerCrane
//
//  Created by Feild Wong on 15/8/14.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel


+ (id)LoginRequestWithName:(NSString *)name pass:(NSString *)pass
{
    LoginModel *model = [[LoginModel alloc] init];

    NSDictionary *dic = @{@"user":name,@"password":pass};
    
    [model.manager GET:[NSString stringWithFormat:@"%@%@",BaseUrl,LoginUrl] parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        model.loginDataDic = responseObject;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    return model;
}

- (void)setLoginDataDic:(NSMutableDictionary *)loginDataDic
{
    if (_loginDataDic != loginDataDic) {
        _loginDataDic = loginDataDic;
    }

    if ([_loginDataDic[@"errMsg"] isEqualToString:@""]) {
        //登陆成功
        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"isLogin"];
        [[NSUserDefaults standardUserDefaults] setObject:_loginDataDic[@"datas"][@"user"] forKey:@"user"];

    }else{
        
    }
    
    NSString *promptString =_loginDataDic[@"errMsg"];

    //发送登陆提示信息
    [[NSNotificationCenter defaultCenter] postNotificationName:LoginSuccessNotification object:nil userInfo:@{@"message":promptString}];
}

+ (BOOL)isLogin
{
    NSString *isLogin = [[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"];
    if ([isLogin isEqualToString:@"1"]) {
        return YES;
    }else{
        return NO;
    }
}
+ (NSString *)getUser
{
    NSString *user = [[NSUserDefaults standardUserDefaults] objectForKey:@"user"];
    if (user) {
        return user;
    }else{
        return @"";
    }
}

@end
