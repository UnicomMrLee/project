//
//  AppDelegate.m
//  Project
//
//  Created by Mr_BruceChen on 2019/3/13.
//  Copyright © 2019 CHINA UNICOM SYSTEM INTEGRATION CO., LTD. HENAN BRANCH. All rights reserved.
//
@import UserNotifications;

#import <FRDModuleManager/FRDModuleManager.h>
#import "AppDelegate.h"
#import "PRBasicTabBarControllerConfig.h"

@interface AppDelegate ()<CYLTabBarControllerDelegate,UITabBarControllerDelegate>

@property (nonatomic, strong) CYLTabBarController *tabBarController;
@end

@implementation AppDelegate

#pragma mark - State Transitions

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 注册组件化 处理解耦
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"ModulesRegister" ofType:@"plist"];
    
    FRDModuleManager *manager = [FRDModuleManager sharedInstance];
    [manager loadModulesWithPlistFile:plistPath];
    
    [manager application:application willFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
     [[FRDModuleManager sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
   [self project_initWithRootViewController];
    return YES;
}

-(void)project_initWithRootViewController{
    PRBasicTabBarControllerConfig *tabBarControllerConfig = [[PRBasicTabBarControllerConfig alloc] init];
    self.tabBarController = tabBarControllerConfig.tabBarController;
    self.tabBarController.delegate = self;
    [self.window setRootViewController:self.tabBarController];
    UIViewController *viewController = self.tabBarController.viewControllers[2];
    [viewController cyl_popSelectTabBarChildViewControllerAtIndex:2];
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    [[self cyl_tabBarController] updateSelectionStatusIfNeededForTabBarController:tabBarController shouldSelectViewController:viewController];
    NSLog(@"--tabbaritem.title--%@",viewController.tabBarItem.title);
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    [[FRDModuleManager sharedInstance] applicationWillResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [[FRDModuleManager sharedInstance] applicationDidEnterBackground:application];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [[FRDModuleManager sharedInstance] applicationWillEnterForeground:application];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[FRDModuleManager sharedInstance] applicationDidBecomeActive:application];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[FRDModuleManager sharedInstance] applicationWillTerminate:application];
}


//#pragma mark - Handling Remote Notification
//
//- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
//    [[FRDModuleManager sharedInstance] application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
//}
//
//- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
//    [[FRDModuleManager sharedInstance] application:application didFailToRegisterForRemoteNotificationsWithError:error];
//}
//
//- (void)application:(UIApplication *)application
//didReceiveRemoteNotification:(NSDictionary *)userInfo
//fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
//{
//    [[FRDModuleManager sharedInstance] application:application
//                      didReceiveRemoteNotification:userInfo
//                            fetchCompletionHandler:completionHandler];
//
//}
//
//#pragma mark - Handling Local Notification
//
//- (void)userNotificationCenter:(UNUserNotificationCenter *)center
//       willPresentNotification:(UNNotification *)notification
//         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
//API_AVAILABLE(ios(10.0)){
//    [[FRDModuleManager sharedInstance] userNotificationCenter:center
//                                      willPresentNotification:notification
//                                        withCompletionHandler:completionHandler];
//}
//
//- (void)userNotificationCenter:(UNUserNotificationCenter *)center
//didReceiveNotificationResponse:(UNNotificationResponse *)response
//         withCompletionHandler:(void (^)(void))completionHandler
//API_AVAILABLE(ios(10.0)){
//    [[FRDModuleManager sharedInstance] userNotificationCenter:center
//                               didReceiveNotificationResponse:response
//                                        withCompletionHandler:completionHandler];
//}

@end
