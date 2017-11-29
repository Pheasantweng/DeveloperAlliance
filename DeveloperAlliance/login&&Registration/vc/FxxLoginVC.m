//
//  FxxLoginVC.m
//  DeveloperAlliance
//
//  Created by zs on 17/11/28.
//  Copyright © 2017年 wengxianshan. All rights reserved.
//

#import "FxxLoginVC.h"
#import "FxxChoosetypeVc.h"
#import "FxxRegistrationVc.h"
#import "FxxMainViewController.h"
@interface FxxLoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *PhoneNumberField;/*电话号码*/
@property (weak, nonatomic) IBOutlet UITextField *PswField;/*密码*/
@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;/*登录*/

@end

@implementation FxxLoginVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES
                                             animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO
                                             animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark 初始化设置
    [self initialization];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)initialization{
    [_PhoneNumberField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_PswField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    _LoginBtn.layer.cornerRadius=17.5;
}
#pragma mark 登录按钮事件
- (IBAction)login:(UIButton *)sender {
    [self.navigationController.view removeFromSuperview];
    FxxMainViewController *Main =[[FxxMainViewController alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController=Main;
}
#pragma mark 注册按钮事件
- (IBAction)RegBtn:(UIButton *)sender {
    FxxChoosetypeVc *Vc =[[FxxChoosetypeVc alloc]init];
    [self.navigationController pushViewController:Vc animated:YES];
}
#pragma mark 忘记密码按钮事件
- (IBAction)Forgetpassword:(UIButton *)sender {
    FxxRegistrationVc *Vc =[[FxxRegistrationVc alloc]init];
    Vc.Pagetype=1;
    Vc.navigationItem.title=@"密码找回";
    [self.navigationController pushViewController:Vc animated:YES];
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
