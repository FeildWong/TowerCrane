//
//  HomeHeadModel.h
//  TowerCrane
//
//  Created by Feild Wong on 15/8/14.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "BaseModel.h"

@interface HomeHeadModel : BaseModel

+ (id)HomeHeadRequestWithName:(NSString *)name finifed:(void(^)(NSDictionary *dataDic))finished;

@end
