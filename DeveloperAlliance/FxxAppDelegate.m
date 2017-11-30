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
#import "RongyunImMethods.h"
#import "FxxMainViewController.h"
@interface FxxAppDelegate ()

@end

@implementation FxxAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[RongyunImMethods sharedInstance]InitSDK];
    FxxMainViewController *RootVc=[[FxxMainViewController alloc]init];
//    BaseNavigationController *NavRootNav =[[BaseNavigationController alloc]initWithRootViewController:RootVc];
    self.window.rootViewController=RootVc;
    [self.window makeKeyWindow];
    [self setNavigationAndTabarForGlobal];
    return YES;
}

#pragma mark 极光推送相关设置 deviceToken
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
//    [JPUSHService registerDeviceToken:deviceToken];
    /*容云*/
    NSString *token =
    [[[[deviceToken description] stringByReplacingOccurrencesOfString:@"<"
                                                           withString:@""]
      stringByReplacingOccurrencesOfString:@">"
      withString:@""]
     stringByReplacingOccurrencesOfString:@" "
     withString:@""];
    [[RCIMClient sharedRCIMClient] setDeviceToken:token];
}

#pragma mark 容云推送相关

/**
 * 推送处理2
 */
//注册用户通知设置
- (void)application:(UIApplication *)application
didRegisterUserNotificationSettings:
(UIUserNotificationSettings *)notificationSettings {
    // register to receive notifications
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // userInfo为远程推送的内容
    [[RCIMClient sharedRCIMClient] recordRemoteNotificationEvent:userInfo];
    /**
     * 获取融云推送服务扩展字段2
     */
    NSDictionary *pushServiceData = [[RCIMClient sharedRCIMClient]
                                     getPushExtraFromRemoteNotification:userInfo];
    if (pushServiceData) {
        for (id key in [pushServiceData allKeys]) {
            
        }
    } else {
        NSLog(@"该远程推送不包含来自融云的推送服务");
    }
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
