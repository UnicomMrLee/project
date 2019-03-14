//
//  PRBasicTabBarControllerConfig.m
//  Project
//
//  Created by Mr_BruceChen on 2019/3/14.
//  Copyright © 2019 CHINA UNICOM SYSTEM INTEGRATION CO., LTD. HENAN BRANCH. All rights reserved.
//

#import "PRBasicTabBarControllerConfig.h"
#import "PRBasicNavigationViewController.h"
#import "UIColor+Hex.h"

#import "PRRecommendViewController.h"
#import "PRSpecialViewController.h"
#import "PRHomeViewController.h"
#import "PRApplicationViewController.h"
#import "PRMeViewController.h"


@interface PRBasicTabBarControllerConfig ()
@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;
@end

@implementation PRBasicTabBarControllerConfig
/**
 *  lazy load tabBarController
 *
 *  @return CYLTabBarController
 */
- (CYLTabBarController *)tabBarController {
    if (!_tabBarController) {
        
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers tabBarItemsAttributes:self.tabBarItemsAttributesForController];
        
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}
- (NSArray *)viewControllers {
    PRRecommendViewController *recommendController = [[PRRecommendViewController alloc] init];
    UIViewController *recommendNavigationController = [[PRBasicNavigationViewController alloc]
                                                   initWithRootViewController:recommendController];
    
    PRSpecialViewController *specialController = [[PRSpecialViewController alloc] init];
    UIViewController *specialNavigationController = [[PRBasicNavigationViewController alloc]
                                                     initWithRootViewController:specialController];
    
    PRHomeViewController *homeController = [[PRHomeViewController alloc] init];
    UIViewController *homeNavigationController = [[PRBasicNavigationViewController alloc]
                                                  initWithRootViewController:homeController];
    
    PRApplicationViewController *applicationController = [[PRApplicationViewController alloc] init];
    UIViewController *applicationthNavigationController = [[PRBasicNavigationViewController alloc]
                                                           initWithRootViewController:applicationController];
    PRMeViewController *meController = [[PRMeViewController alloc] init];
    UIViewController *meNavigationController = [[PRBasicNavigationViewController alloc]
                                                initWithRootViewController:meController];
    
    
    NSArray *viewControllers = @[
                                 recommendNavigationController,
                                 specialNavigationController,
                                 homeNavigationController,
                                 applicationthNavigationController,
                                 meNavigationController
                                 ];
    return viewControllers;
}
- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *learnTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"推荐",
                                                 CYLTabBarItemImage : @"stuly-default",
                                                 CYLTabBarItemSelectedImage : @"stuly",
                                                 
                                                 //                                                 CYLTabBarItemImageInsets: [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)],
                                                 //                                                 CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(0, 0)]
                                                 };
    NSDictionary *specialTabBarItemsAttributes = @{
                                                   CYLTabBarItemTitle : @"专题",
                                                   CYLTabBarItemImage : @"special-default",
                                                   CYLTabBarItemSelectedImage : @"special",                                                  //                                                 CYLTabBarItemImageInsets: [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)],
                                                   //                                                 CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(0, 0)]
                                                   };
    NSDictionary *homeTabBarItemsAttributes = @{
                                                CYLTabBarItemTitle : @"首页",
                                                CYLTabBarItemImage : @"index-default",
                                                CYLTabBarItemSelectedImage : @"index",                                                   //                                                 CYLTabBarItemImageInsets: [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)],
                                                //                                                 CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(0, 0)]
                                                };
    NSDictionary *applicationTabBarItemsAttributes = @{
                                                       CYLTabBarItemTitle : @"应用",
                                                       CYLTabBarItemImage : @"apply-default",
                                                       CYLTabBarItemSelectedImage : @"apply",
                                                       //                                                 CYLTabBarItemImageInsets: [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)],
                                                       //                                                 CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(0, 0)]
                                                       };
    
    NSDictionary *meTabBarItemsAttributes = @{
                                              CYLTabBarItemTitle : @"我的",
                                              CYLTabBarItemImage : @"mine-default",
                                              CYLTabBarItemSelectedImage : @"mine"
                                              //                                                 CYLTabBarItemImageInsets: [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)],
                                              //                                                 CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(0, 0)]
                                              };
    NSArray *tabBarItemsAttributes = @[
                                       learnTabBarItemsAttributes,
                                       specialTabBarItemsAttributes,
                                       homeTabBarItemsAttributes,
                                       applicationTabBarItemsAttributes,
                                       meTabBarItemsAttributes,
                                       ];
    return tabBarItemsAttributes;
}
/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    
    // Customize UITabBar height
    // 自定义 TabBar 高度
    //tabBarController.tabBarHeight =ChinaUTabBarHeight;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:PRGLOBALTHEMECOLOR];
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    [[UITabBar appearance] setTintColor:[UIColor redColor]];
    // set the bar background image
    // 设置背景图片
    UITabBar *tabBarAppearance = [UITabBar appearance];
    
    //FIXED: #196
    UIImage *tabBarBackgroundImage = [UIImage imageNamed:@"tab_bar"];
    UIImage *scanedTabBarBackgroundImage = [[self class] scaleImage:tabBarBackgroundImage toScale:1.0];
    [tabBarAppearance setBackgroundImage:scanedTabBarBackgroundImage];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // iOS10 后 需要使用 `-[CYLTabBarController hideTabBadgeBackgroundSeparator]` 见 AppDelegate 类中的演示;
    //    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

- (void)updateTabBarCustomizationWhenTabBarItemWidthDidUpdate {
    void (^deviceOrientationDidChangeBlock)(NSNotification *) = ^(NSNotification *notification) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
        if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) {
            NSLog(@"Landscape Left or Right !");
        } else if (orientation == UIDeviceOrientationPortrait) {
            NSLog(@"Landscape portrait!");
        }
        [self customizeTabBarSelectionIndicatorImage];
    };
    [[NSNotificationCenter defaultCenter] addObserverForName:CYLTabBarItemWidthDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:deviceOrientationDidChangeBlock];
}

- (void)customizeTabBarSelectionIndicatorImage {
    ///Get initialized TabBar Height if exists, otherwise get Default TabBar Height.
    CGFloat tabBarHeight = kTabBarHeight;
    CGSize selectionIndicatorImageSize = CGSizeMake(CYLTabBarItemWidth, tabBarHeight);
    //Get initialized TabBar if exists.
    UITabBar *tabBar = [self cyl_tabBarController].tabBar ?: [UITabBar appearance];
    [tabBar setSelectionIndicatorImage:
     [[self class] imageWithColor:[UIColor yellowColor]
                             size:selectionIndicatorImageSize]];
}

+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize {
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width * scaleSize, image.size.height * scaleSize);
    UIGraphicsBeginImageContextWithOptions(size, NO, 1.0);
    [image drawInRect:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
