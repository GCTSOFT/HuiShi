//
//  AppUserContext.m
//  HuiShi
//
//  Created by admin on 16/8/6.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "AppUserContext.h"
#import "SSKeychain.h"

@interface AppUserContext ()
{
    NSString *_atoken;
}

@end

@implementation AppUserContext

+ (AppUserContext *)shareInstance
{
    static AppUserContext *ap=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ap = [[AppUserContext alloc] init];
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

- (NSString *)token
{
    if (self.autoLogin) {
        if (_atoken.length > 0) {
            return _atoken;
        }
        NSString *st = [SSKeychain passwordForService:kKayChainMainKey account:@"logintoken" error:nil];
        if (st == nil) {
            return @"";
        }
        return st;
    } else {
        if (_atoken.length > 0) {
            return _atoken;
        } else {
            return @"";
        }
    }
}

- (void)setToken:(NSString *)token
{
    if (token.length > 0) {
        _atoken = token;
        if (self.autoLogin) {
            [SSKeychain setPassword:token forService:kKayChainMainKey account:@"logintoken"];
        }
    }
}

- (BOOL)autoLogin
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"autologin"] boolValue];
}

- (void)setAutoLogin:(BOOL)autoLogin
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:autoLogin] forKey:@"autologin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)loginWithAccount:(NSString *)account password:(NSString *)password callback:(UserCallBack)callback isauto:(BOOL)autoL
{
    
    NSData *requestData = [[NSString stringWithFormat:@"username=%@&password=%@", account, password] dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *ru = [NSURL URLWithString:@"http://wyeth.api.hih6.com/site/login"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:ru];
    request.HTTPMethod = @"POST";
    request.HTTPBody = requestData;
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        callback(data);
    }];
    [task resume];
    
    NSLog(@"发送请求成功");
}

@end
