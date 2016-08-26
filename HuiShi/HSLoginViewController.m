//
//  HSLoginViewController.m
//  HuiShi
//
//  Created by admin on 16/7/13.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "HSLoginViewController.h"
#import "AppUserContext.h"

@interface HSLoginViewController ()

@property (strong, nonatomic) IBOutlet UITextField *accountLabel;
@property (strong, nonatomic) IBOutlet UITextField *passwordLabel;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIButton *forgetButton;
@property (strong, nonatomic) IBOutlet UIButton *remenberButton;
@property (nonatomic) BOOL isAuto;

@end

@implementation HSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isAuto = NO;
    // Do any additional setup after loading the view.
    UIImageView *imv = [[UIImageView alloc] init];
    imv.image = [UIImage imageNamed:@"yonghu.png"];
    imv.frame = CGRectMake(0, 0, 26, 22);
    self.accountLabel.leftView = imv;
    self.accountLabel.leftViewMode = UITextFieldViewModeAlways;
    imv = [[UIImageView alloc] init];
    imv.frame = CGRectMake(0, 0, 26, 22);
    imv.image = [UIImage imageNamed:@"mima-1.png"];
    self.passwordLabel.leftView = imv;
    self.passwordLabel.leftViewMode = UITextFieldViewModeAlways;
    self.passwordLabel.backgroundColor = [UIColor whiteColor];
    self.passwordLabel.placeholder = @"密码";
    self.accountLabel.backgroundColor = [UIColor whiteColor];
    self.accountLabel.placeholder = @"用户名";
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
- (IBAction)LoginButtonClick:(UIButton *)sender
{
//    self.accountLabel.text = @"chang.liu@wyethnutrition.com";
//    self.passwordLabel.text = @"888888";
    
    if (self.accountLabel.text.length > 0 && self.passwordLabel.text.length > 0) {
        if (self.isAuto == YES) {
            AppUContext.account = self.accountLabel.text;
            AppUContext.password = self.passwordLabel.text;
            AppUContext.autoLogin = YES;
        }
        
        [AppUContext loginWithAccount:self.accountLabel.text password:self.passwordLabel.text callback:^(NSData *data) {
            
            if (data) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                
                NSString *result = [dic objectForKey:@"status"];
                
                if ([result isEqualToString:@"success"]) {
                    
                    NSString *token = [dic objectForKey:@"access-token"];
                    if (token.length > 0) {
                        AppUContext.token = token;
                        AppUContext.isLogin = YES;
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self dismissViewControllerAnimated:YES completion:nil];
                    });
                } else {
                    NSLog(@"登录失败");
                }
                NSLog(@"login %@", dic);
            }

        } isauto:self.isAuto];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
/*
NSString *sss = [NSString stringWithFormat:@"%@:111111", AppUContext.token];
NSURL *ru = [NSURL URLWithString:@"http://wyeth.api.hih6.com/score/view"];
NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:ru];
request.HTTPMethod = @"POST";
[request setValue:[NSString stringWithFormat:@"Basic %@",[sss base64EncodedString]] forHTTPHeaderField:@"Authorization"];
NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    NSString *s = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", s);
}];
[task resume];
*/

@end
