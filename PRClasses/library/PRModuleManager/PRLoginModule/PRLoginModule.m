//
//  PRLoginModule.m
//  Project
//
//  Created by Mr_BruceChen on 2019/3/14.
//  Copyright © 2019 CHINA UNICOM SYSTEM INTEGRATION CO., LTD. HENAN BRANCH. All rights reserved.
//

#import "PRLoginModule.h"

@implementation PRLoginModule
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"%@  login", NSStringFromSelector(_cmd));
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"%@  login", NSStringFromSelector(_cmd));
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"%@  login", NSStringFromSelector(_cmd));
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"%@  login", NSStringFromSelector(_cmd));
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"%@  login", NSStringFromSelector(_cmd));
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"%@  login", NSStringFromSelector(_cmd));
}

@end
