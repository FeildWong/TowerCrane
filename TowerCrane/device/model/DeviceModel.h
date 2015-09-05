//
//  DeviceModel.h
//  TowerCrane
//
//  Created by Feild Wong on 15/8/15.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "BaseModel.h"

@interface DeviceModel : BaseModel

+ (id)deviceListRequestWithName:(NSDictionary *)paramDic finifed:(void(^)(NSDictionary *dataDic))finished;

@end
