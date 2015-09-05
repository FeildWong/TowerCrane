//
//  ProjectListModel.h
//  TowerCrane
//
//  Created by 王鹏飞 on 15/8/26.
//  Copyright (c) 2015年 com.gongyou. All rights reserved.
//

#import "BaseModel.h"

@interface ProjectListModel : BaseModel

+ (id)projectListRequestWithName:(NSDictionary *)paramDic finifed:(void(^)(NSDictionary *dataDic))finished;

@end
