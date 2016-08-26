//
//  FooterView.m
//  HuiShi
//
//  Created by xiemingmin on 16/8/24.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "FooterView.h"

@implementation FooterView


- (IBAction)clickNextButton:(id)sender {
    
    if (self.block) {
        self.block();
    }
    NSLog(@"dianji");
    
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
