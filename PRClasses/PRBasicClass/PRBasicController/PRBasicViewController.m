//
//  PRBasicViewController.m
//  Project
//
//  Created by Mr_BruceChen on 2019/3/13.
//  Copyright © 2019 CHINA UNICOM SYSTEM INTEGRATION CO., LTD. HENAN BRANCH. All rights reserved.
//

#import "PRBasicViewController.h"

@interface PRBasicViewController ()

@end

@implementation PRBasicViewController

#pragma mark -- 设置状态栏为白色
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

@end
