//
//  FxxMainViewController.m
//  DeveloperAlliance
//
//  Created by zs on 17/11/28.
//  Copyright © 2017年 wengxianshan. All rights reserved.
//

#import "FxxMainViewController.h"
#import "FxxHomeViewController.h"
#import "FxxBBSViewController.h"
#import "FxxPersonalcenterVC.h"
#import "BaseNavigationController.h"
@interface FxxMainViewController ()

@end

@implementation FxxMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self UserloadViewControllers];
    
    // Do any additional setup after loading the view.
}

- (void)UserloadViewControllers
{
    FxxHomeViewController *Home =[[FxxHomeViewController alloc]init];
    BaseNavigationController * Nav1=[[BaseNavigationController alloc]initWithRootViewController:Home];
    [self setTabBarItemForNavigationController:
         Nav1 normalImageName:@"Home_0" selectedImageName:@"Home_1" title:@"首页"];
    FxxBBSViewController *BBS =[[FxxBBSViewController alloc]init];
    BaseNavigationController * Nav2=[[BaseNavigationController alloc]initWithRootViewController:BBS];
    [self setTabBarItemForNavigationController:
     Nav2 normalImageName:@"BBS_0" selectedImageName:@"BBS_1" title:@"论坛"];
    FxxPersonalcenterVC *person =[[FxxPersonalcenterVC alloc]init];
    BaseNavigationController * Nav3=[[BaseNavigationController alloc]initWithRootViewController:person];
    [self setTabBarItemForNavigationController:
     Nav3 normalImageName:@"Personalcenter_0" selectedImageName:@"Personalcenter_1" title:@"我的"];
    self.viewControllers=@[Nav1,Nav2,Nav3];
}
/*!
 * @abstract TabBar字体渲染
 */
-(void)setTabBarItemForNavigationController:(UINavigationController*)navigationController normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName title:(NSString*)title{
    navigationController.tabBarItem.image = [[UIImage imageNamed:normalImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigationController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigationController.tabBarItem.title = title;
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
