//
//  DeviceDetailModel.m
//  TowerCrane
//
//  Created by 王鹏飞 on 15/8/26.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "DeviceDetailModel.h"
#import "LoginModel.h"

@implementation DeviceDetailModel

+ (id)deviceDetailRequestWithName:(NSDictionary *)paramDic finifed:(void(^)(NSDictionary *dataDic))finished
{
    DeviceDetailModel *model = [[DeviceDetailModel alloc] init];
    
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionaryWithDictionary:paramDic];
    
    [dataDic setObject:[LoginModel getUser] forKey:@"user"];
    
    [model.manager GET:[NSString stringWithFormat:@"%@%@",BaseUrl,DeviceDetailUrl] parameters:dataDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        finished(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    return model;
}

@end
