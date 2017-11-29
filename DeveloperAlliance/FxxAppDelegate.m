//
//  AppDelegate.m
//  DeveloperAlliance
//
//  Created by zs on 17/11/27.
//  Copyright © 2017年 wengxianshan. All rights reserved.
//

#import "FxxAppDelegate.h"
#import "FxxLoginVC.h"
#import "BaseNavigationController.h"
@interface FxxAppDelegate ()

@end

@implementation FxxAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    FxxLoginVC *RootVc=[[FxxLoginVC alloc]init];
    BaseNavigationController *NavRootNav =[[BaseNavigationController alloc]initWithRootViewController:RootVc];
    self.window.rootViewController=NavRootNav;
    [self.window makeKeyWindow];
    [self setNavigationAndTabarForGlobal];
    return YES;
}
/*!
 * @abstract 自定义tabBar和导航栏颜色
 */
-(void)setNavigationAndTabarForGlobal
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    //导航栏皮肤
    navBar.barTintColor = GlobalColor;
    NSDictionary *att = @{
                          NSForegroundColorAttributeName:[UIColor whiteColor],
                          NSFontAttributeName : [UIFont systemFontOfSize:18.f]
                          };
    [navBar setTitleTextAttributes:att];
    //获得UIBarButtonItem全局对象
    UIBarButtonItem *item= [UIBarButtonItem appearance];
    [item setTitleTextAttributes:att forState:UIControlStateNormal];
    //设置全局返回按钮
    UIImage * image=[[UIImage imageNamed:@"back"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [item setBackButtonBackgroundImage:image forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin)
                                 forBarMetrics:UIBarMetricsDefault];
    
    //全局TabBarItem的字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       NorGlobalColor, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       GlobalColor, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
