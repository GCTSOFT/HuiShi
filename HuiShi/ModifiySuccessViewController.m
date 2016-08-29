//
//  ModifiySuccessViewController.m
//  HuiShi
//
//  Created by xiemingmin on 16/8/25.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "ModifiySuccessViewController.h"
#import "HSLoginViewController.h"
#import "HomeViewController.h"
#import "AppUserContext.h"
@interface ModifiySuccessViewController ()

@end

@implementation ModifiySuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"重置成功";
    
//    [self.navigationItem setHidesBackButton:YES];
}

- (IBAction)loginAgain:(id)sender {
    
    //    AppUContext.token = nil;
    //    AppUContext.account = nil;
    //    AppUContext.password = nil;
    //    AppUContext.autoLogin = NO;
    //    AppUContext.isLogin = NO;
    //    AppUContext.userLevel = 0;
         HSLoginViewController *login = [self.storyboard instantiateViewControllerWithIdentifier:@"HSLoginViewController"];
        [self presentViewController:login animated:NO completion:nil];
}

    



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
