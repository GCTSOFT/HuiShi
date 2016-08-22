//
//  AppContext.h
//  HuiShi
//
//  Created by admin on 16/7/24.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "HomeViewController.h"


#define Main_GaiLan 0
#define Main_MinePaiMing 1
#define Main_TotalPaiMing 2
#define Main_SinglePaiMing 3
#define Main_MineNotify 4
#define Main_Setting 5

#define AppContext [AppContextObject shareInstance]

@interface AppContextObject : NSObject

+ (AppContextObject *)shareInstance;

@property (nonatomic) NSInteger mainSelectIndex;
@property (nonatomic, strong) AppDelegate *appdelegate;
@property (nonatomic, strong) TabBarViewController *tabController;

@end
