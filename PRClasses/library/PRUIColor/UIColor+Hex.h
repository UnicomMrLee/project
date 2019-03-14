//
//  UIColor+Hex.h
//  Project
//
//  Created by Mr_BruceChen on 2019/3/14.
//  Copyright © 2019 CHINA UNICOM SYSTEM INTEGRATION CO., LTD. HENAN BRANCH. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Hex)

/**
 十六进制颜色值

 @param color 16进制颜色值
 @return color
 */
+ (UIColor *)colorWithHexString:(NSString *)color;


/**
 从十六进制字符串获取颜色

 @param color 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 @param alpha 透明度
 @return color
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
