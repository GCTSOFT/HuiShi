//
//  AppUserContext.m
//  HuiShi
//
//  Created by admin on 16/8/6.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "AppUserContext.h"
#import "SSKeychain.h"
#import "CommonDefine.h"

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
    NSURL *ru = [NSURL URLWithString:kDengLuUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:ru];
    request.HTTPMethod = @"POST";
    request.HTTPBody = requestData;
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        callback(data);
    }];
    [task resume];
    
    NSLog(@"发送请求成功");
}

- (void)resetLoginWithOldpassword:(NSString *)oldpassword newpassword:(NSString *)newpasswod success:(UserCallBack)success failure:(UserCallBack)failure
{
    if (oldpassword.length > 0 && newpasswod.length > 0) {
        NSString *sss = [NSString stringWithFormat:@"%@:111111", AppUContext.token];
        NSURL *ru = [NSURL URLWithString:kXiuGaiMiMaUrl];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:ru];
        request.HTTPMethod = @"POST";
        NSData *bodydata = [[NSString stringWithFormat:@"oldpassword=%@&newpassword=%@", oldpassword, newpasswod] dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:bodydata];
        [request setValue:[NSString stringWithFormat:@"Basic %@",[sss base64EncodedString]] forHTTPHeaderField:@"Authorization"];
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSString *result = [dic objectForKey:@"status"];
            if ([result isEqualToString:@"success"]) {
                if (success) {
                    success(dic);
                }
            } else {
                if (failure) {
                    failure(dic);
                }
            }
        }];
        [task resume];
    }else
    {
        NSLog(@"输入框为空");
    
    }
}

@end
