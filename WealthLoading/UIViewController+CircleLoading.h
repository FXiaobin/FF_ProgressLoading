//
//  UIViewController+CircleLoading.h
//  FF_CircleLoading
//
//  Created by fanxiaobin on 2017/4/13.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadView.h"

@interface UIViewController (CircleLoading)


- (void)showLoading;

- (void)hiddenLoading;

- (void)updateCircleProgress:(CGFloat)progress;

@end
