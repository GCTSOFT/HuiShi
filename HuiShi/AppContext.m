//
//  AppContext.m
//  HuiShi
//
//  Created by admin on 16/7/24.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "AppContext.h"

@implementation AppContextObject

+ (AppContextObject *)shareInstance
{
    static AppContextObject *ap;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ap = [[AppContextObject alloc] init];
    });
    return ap;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (AppDelegate *)appdelegate
{
    return [[UIApplication sharedApplication] delegate];
}

- (TabBarViewController *)tabController
{
    TabBarViewController *con = [AppContext.appdelegate.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"TabBarViewController"];
        
    for (UINavigationController * nav in con.viewControllers) {
        NSLog(@"controller:%@",nav.viewControllers);
    }
    
    return con;
}

@end
