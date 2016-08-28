//
//  CommonDefine.h
//  HuiShi
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h


#import "AppContext.h"
#import "AppUserContext.h"
#import "Base64.h"


#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height



#define kDengLuUrl @"http://wyeth.api.hih6.com/site/login"
#define kXiuGaiMiMaUrl @"http://wyeth.api.hih6.com/setting/resetpassword"

#define kZiShenPaiMingUrl @"http://wyeth.api.hih6.com/score/index"
#define kTuanDuiPainMingUrl @"http://wyeth.api.hih6.com/score/leader"
#define kXiaShuPaiMingUrl @"http://wyeth.api.hih6.com/score/sort"


#endif /* CommonDefine_h */


/*
 获取自身排名
 url:wyeth.api.hih6.com/score/index
 group : region 按当前大区排
 y : year
 m : month
	获取团队排名
 url:wyeth.api.hih6.com/score/leader
 group : region 按当前大区排
 y : year
 m : month
 
	获取下属排名
 url:wyeth.api.hih6.com/score/sort
 item : 项目ID
 y : year
 m : month
 
 */