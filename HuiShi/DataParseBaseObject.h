//
//  DataParseBaseObject.h
//  HuiShi
//
//  Created by admin on 16/8/28.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataBaseItem.h"

@interface DataParseBaseObject : NSObject

- (void)parseWithData:(id)data;

@end



@interface OwnerRankDataParse : DataParseBaseObject

@property (nonatomic, strong) NSMutableArray *listArray;

@end

@interface TeamRankDataParse : DataParseBaseObject

@property (nonatomic, strong) NSMutableArray *listArray;

@end

@interface SubordinateRankDataParse : DataParseBaseObject

@property (nonatomic, strong) NSMutableArray *listArray;

@end

