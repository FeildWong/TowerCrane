//
//  LoginModel.h
//  TowerCrane
//
//  Created by Feild Wong on 15/8/14.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "BaseModel.h"

#define LoginSuccessNotification  @"LoginSuccessNotification"

@interface LoginModel : BaseModel

@property(nonatomic ,strong) NSMutableDictionary *loginDataDic;

// 请求登陆
+ (id)LoginRequestWithName:(NSString *)name pass:(NSString *)pass;

//判断是否登陆
+ (BOOL)isLogin;
//获取用户名

+ (NSString *)getUser;

//获取用户类型

@end
