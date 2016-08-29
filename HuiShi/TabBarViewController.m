//
//  TabBarViewController.m
//  HuiShi
//
//  Created by admin on 16/7/24.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.hidden = YES;
    
#warning  -- ceshitabbar
    self.tabBar.hidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectIndex:) name:@"SelectTabBarViewControllerIndexNotification" object:nil];
}
//-(void)selectIndex:(NSNotification*)noti{
//    NSDictionary * userInfo = noti.userInfo;
//    NSInteger selectIndex = [userInfo[@"index"] integerValue];
//    self.selectedIndex = selectIndex;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
