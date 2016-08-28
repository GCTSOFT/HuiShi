//
//  DataRequest.h
//  HuiShi
//
//  Created by admin on 16/8/28.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^DataRequestBlock)(id data);

@interface DataRequest : NSObject

// 自身排名
+ (void)requestOwnRankWithRegion:(NSString *)region year:(NSString *)year month:(NSString *)month success:(DataRequestBlock)success failure:(DataRequestBlock)failure;

// 团队排名
+ (void)requestTeamRankWithRegion:(NSString *)region year:(NSString *)year month:(NSString *)month success:(DataRequestBlock)success failure:(DataRequestBlock)failure;

// 下属排名
+ (void)requestSubordinateRankWithRegion:(NSString *)region year:(NSString *)year month:(NSString *)month success:(DataRequestBlock)success failure:(DataRequestBlock)failure;



@end
