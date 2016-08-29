//
//  DataRequest.m
//  HuiShi
//
//  Created by admin on 16/8/28.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "DataRequest.h"
#import "CommonDefine.h"
#import "DataParseBaseObject.h"

@implementation DataRequest

+ (void)requestOwnRankWithRegion:(NSString *)region year:(NSString *)year month:(NSString *)month success:(DataRequestBlock)success failure:(DataRequestBlock)failure
{
    NSString *sss = [NSString stringWithFormat:@"%@:111111", AppUContext.token];
    NSURL *ru = [NSURL URLWithString:kZiShenPaiMingUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:ru];
    [request setValue:[NSString stringWithFormat:@"Basic %@",[sss base64EncodedString]] forHTTPHeaderField:@"Authorization"];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSString *result = [dic objectForKey:@"status"];
        if ([result isEqualToString:@"success"]) {
            NSDictionary *datadic = [dic objectForKey:@"data"];
            OwnerRankDataParse *parse = [[OwnerRankDataParse alloc] init];
            [parse parseWithData:datadic];
            if (success) {
                success(parse);
            }
        } else {
            if (failure) {
                failure(dic);
            }
        }
    }];
    [task resume];
}

// 团队排名
+ (void)requestTeamRankWithRegion:(NSString *)region year:(NSString *)year month:(NSString *)month success:(DataRequestBlock)success failure:(DataRequestBlock)failure
{
    NSString *sss = [NSString stringWithFormat:@"%@:111111", AppUContext.token];
    NSURL *ru = [NSURL URLWithString:kTuanDuiPainMingUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:ru];
    [request setValue:[NSString stringWithFormat:@"Basic %@",[sss base64EncodedString]] forHTTPHeaderField:@"Authorization"];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSString *result = [dic objectForKey:@"status"];
        if ([result isEqualToString:@"success"]) {
            NSDictionary *datadic = [dic objectForKey:@"data"];
            TeamRankDataParse *parse = [[TeamRankDataParse alloc] init];
            [parse parseWithData:datadic];
            if (success) {
                success(parse);
            }
        } else {
            if (failure) {
                failure(dic);
            }
        }
    }];
    [task resume];
}

// 下属排名
+ (void)requestSubordinateRankWithRegion:(NSString *)region year:(NSString *)year month:(NSString *)month success:(DataRequestBlock)success failure:(DataRequestBlock)failure
{
    NSString *sss = [NSString stringWithFormat:@"%@:111111", AppUContext.token];
    NSURL *ru = [NSURL URLWithString:kXiaShuPaiMingUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:ru];
    [request setValue:[NSString stringWithFormat:@"Basic %@",[sss base64EncodedString]] forHTTPHeaderField:@"Authorization"];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSString *result = [dic objectForKey:@"status"];
        if ([result isEqualToString:@"success"]) {
            NSArray *array = [dic objectForKey:@"data"];
            SubordinateRankDataParse *parse = [[SubordinateRankDataParse alloc] init];
            [parse parseWithData:array];
            if (success) {
                success(parse);
            }
        } else {
            if (failure) {
                failure(dic);
            }
        }
    }];
    [task resume];
}

@end
