//
//  PopBackView.m
//  HuiShi
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "PopBackView.h"

@implementation PopBackView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(touchBgView:)]) {
        [self.delegate touchBgView:self];
    }
}

@end
