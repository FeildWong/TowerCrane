//
//  Interface.h
//  塔机监控
//
//  Created by WangPF on 15/5/10.
//  Copyright (c) 2015年 com.GongYou.TowerCrane. All rights reserved.
//

#ifndef _____Interface_h
#define _____Interface_h

#import "AFNetworking.h"


#define BaseUrl @"http://113.17.171.37:8088/"

//--------------------------------------------------------
//Login interface
//--------------------------------------------------------

#define LoginUrl @"phone/User.ashx"

//--------------------------------------------------------
//Home interface
//--------------------------------------------------------
#define HomeHeadUrl @"phone/Advinfo.ashx"


//--------------------------------------------------------
//device interface
//--------------------------------------------------------
#define DeviceListUrl @"phone/Crane.ashx"           //设备列表
#define DeviceDetailUrl @"phone/CraneInfo.ashx"     //设备详情

//--------------------------------------------------------
//project interface
//--------------------------------------------------------
#define ProjectListUrl @"phone/Project.ashx"           //项目列表



#endif
