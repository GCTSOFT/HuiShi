//
//  AppUserContext.h
//  HuiShi
//
//  Created by admin on 16/8/6.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kKayChainMainKey @"HuiShiYYP"

#define AppUContext [AppUserContext shareInstance]

typedef void (^UserCallBack)(id data);

@interface AppUserContext : NSObject

+ (AppUserContext *)shareInstance;

@property (strong, nonatomic) NSString *token;
@property (strong, nonatomic) NSString *account;
@property (strong, nonatomic) NSString *password;
@property (nonatomic) BOOL autoLogin;
@property (nonatomic) BOOL isLogin;

@property (nonatomic, assign) int userLevel;

- (void)loginWithAccount:(NSString *)account password:(NSString *)password callback:(UserCallBack)callback isauto:(BOOL)autoL;

@end
