//
//  DeviceModel.m
//  TowerCrane
//
//  Created by Feild Wong on 15/8/15.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "DeviceModel.h"
#import "LoginModel.h"

@implementation DeviceModel

//获取列表
+ (id)deviceListRequestWithName:(NSDictionary *)paramDic finifed:(void(^)(NSDictionary *dataDic))finished
{
    DeviceModel *model = [[DeviceModel alloc] init];
    
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionaryWithDictionary:paramDic];
    
    [dataDic setObject:[LoginModel getUser] forKey:@"user"];
    
    [model.manager GET:[NSString stringWithFormat:@"%@%@",BaseUrl,DeviceListUrl] parameters:dataDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        finished(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    return model;
}



@end
