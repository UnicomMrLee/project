//
//  PRBasicTabBarControllerConfig.h
//  Project
//
//  Created by Mr_BruceChen on 2019/3/14.
//  Copyright © 2019 CHINA UNICOM SYSTEM INTEGRATION CO., LTD. HENAN BRANCH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYLTabBarController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PRBasicTabBarControllerConfig : NSObject
@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;
@property (nonatomic, copy) NSString *context;
@end

NS_ASSUME_NONNULL_END
