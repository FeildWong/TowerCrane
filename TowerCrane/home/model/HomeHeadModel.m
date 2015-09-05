//
//  HomeHeadModel.m
//  TowerCrane
//
//  Created by Feild Wong on 15/8/14.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "HomeHeadModel.h"

@implementation HomeHeadModel
+ (id)HomeHeadRequestWithName:(NSString *)name finifed:(void(^)(NSDictionary *dataDic))finished
{
    HomeHeadModel *model = [[HomeHeadModel alloc] init];
    
    NSDictionary *dic = @{@"user":name,@"mode":@"head"};
    
    [model.manager GET:[NSString stringWithFormat:@"%@%@",BaseUrl,HomeHeadUrl] parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        finished(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    return model;
}

@end
