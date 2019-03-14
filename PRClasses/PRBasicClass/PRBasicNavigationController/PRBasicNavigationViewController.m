//
//  PRBasicNavigationViewController.m
//  Project
//
//  Created by Mr_BruceChen on 2019/3/13.
//  Copyright © 2019 CHINA UNICOM SYSTEM INTEGRATION CO., LTD. HENAN BRANCH. All rights reserved.
//

#import "PRBasicNavigationViewController.h"
#import "UINavigationController+SJVideoPlayerAdd.h"
#import <objc/message.h>

@interface PRBasicNavigationViewController ()

@end

@implementation PRBasicNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sj_backgroundColor = [UIColor whiteColor];
    self.sj_transitionMode = SJScreenshotTransitionModeShifting;
    self.sj_gestureType = SJFullscreenPopGestureType_Full;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
   
    if (self.viewControllers.count >0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    [super pushViewController:viewController animated:animated];
}


@end
