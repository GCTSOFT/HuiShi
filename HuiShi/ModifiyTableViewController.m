//
//  ModifiyTableViewController.m
//  HuiShi
//
//  Created by xiemingmin on 16/8/29.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "ModifiyTableViewController.h"
#import "FooterView.h"
#import "ModifiySuccessViewController.h"
#import "AppUserContext.h"
#import "Base64.h"
@interface ModifiyTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *oldTextField;

@property (weak, nonatomic) IBOutlet UITextField *zinTextField;
@property (weak, nonatomic) IBOutlet UITextField *sureTextField;

@end

@implementation ModifiyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =@"修改密码";
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 40, 40);
    
    [backBtn setImage:[UIImage imageNamed:@"Writeoffs_btn@2x.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tapGesture];
}
-(void)tapGesture:(id)sender
{
    [self.view endEditing:YES];
    
}
-(void)doBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


#pragma mark - Table view 的设定
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
        
    }else if (section == 1)
    {
        return 1;
    }else
    {
        return 100;
    }
}


//这是分区尾
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    
    FooterView *footerView;
    
    
    if (section == 2) {
        footerView.headerIndex = section;
        footerView = [[[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:nil options:nil] lastObject];
        footerView.block= ^()
        {
            
            if (![self.zinTextField.text  isEqualToString:self.sureTextField.text]) {
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@"提示"
                                      message:@"两次输入的密码不一致"
                                      delegate:nil
                                      cancelButtonTitle:@"确定"
                                      otherButtonTitles:nil];
                [alert show];
            }else{//新密码和旧密码是一样的
                
                //                NSString *searchText = @"11111112a、";
                
                //***调用关键方法，获得bool值，yes或者no：
                BOOL ok= [self isIncludeSpecialCharact:self.zinTextField.text];
                if (ok==YES) {
                    NSLog(@"包含有特殊字符");
                    
                    NSError *error = NULL;
                    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,20}$" options:NSRegularExpressionDotMatchesLineSeparators error:&error];
                    NSTextCheckingResult *result = [regex firstMatchInString:self.zinTextField.text options:0 range:NSMakeRange(0, [self.zinTextField.text length])];
                    if (result) {
                        NSLog(@"searchTe=%@", [self.zinTextField.text substringWithRange:result.range]);
                        
                        [AppUContext resetLoginWithOldpassword:self.oldTextField.text newpassword:self.zinTextField.text success:^(id data) {
                            
                            NSLog(@"修改密码成功");
                            ModifiySuccessViewController *success =[self.storyboard instantiateViewControllerWithIdentifier:@"ModifiySuccessViewController"];
                            
                            [self.navigationController pushViewController:success animated:YES];
                            NSLog(@"服务器返回来的数据data:%@",data);
                            
                        } failure:^(id data) {
                            UIAlertView *alert = [[UIAlertView alloc]
                                                  initWithTitle:@"提示"
                                                  message:@"修改密码失败"
                                                  delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
                            [alert show];
                            NSLog(@"修改密码失败");
                            NSLog(@"服务器返回来的数据data:%@",data);
                        }];
                        
                    }else
                    {
                        NSLog(@"所要条件匹配失败.失败原因是:%@",error);
                        
                        UIAlertView *alert = [[UIAlertView alloc]
                                              initWithTitle:@"提示"
                                              message:@"请输入正确密码"
                                              delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
                        [alert show];
                    }
                }else{
                    NSLog(@"不包含特殊字符");
                    UIAlertView *alert = [[UIAlertView alloc]
                                          initWithTitle:@"提示"
                                          message:@"请输入正确密码"
                                          delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
                    [alert show];
                }
                
//                2跳转
//                ModifiySuccessViewController *success =[self.storyboard instantiateViewControllerWithIdentifier:@"ModifiySuccessViewController"];
//                
//                [self.navigationController pushViewController:success animated:YES];
            
//                [AppUContext resetLoginWithOldpassword:self.oldTextField.text newpassword:self.zinTextField.text success:^(id data) {
//                    
//                        NSLog(@"修改密码成功");
//                        ModifiySuccessViewController *success =[self.storyboard instantiateViewControllerWithIdentifier:@"ModifiySuccessViewController"];
//                
//                        [self.navigationController pushViewController:success animated:YES];
//                        NSLog(@"服务器返回来的数据data:%@",data);
//                } failure:^(id data) {
//                    
//                        NSLog(@"修改密码失败");
//                        NSLog(@"服务器返回来的数据data:%@",data);
//                }];
                
                
            }
            
        };
        
    }
    
    return footerView;
}
-(BOOL)isIncludeSpecialCharact: (NSString *)str {
    //***需要过滤的特殊字符：~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€`!$=':;',\\[\\].<>?！……（）;—|‘；：”“'。，、？"]];
    
    if (urgentRange.location == NSNotFound)
    {
        return NO;
    }
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
