//
//  BaseModel.m
//  TowerCrane
//
//  Created by Feild Wong on 15/8/14.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (id)init
{
    self = [super init];
    [self configManager];
    return self;
}

- (void)configManager
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    
    self.manager = manager;
}

@end
