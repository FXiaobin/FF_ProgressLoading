//
//  UIViewController+CircleLoading.m
//  FF_CircleLoading
//
//  Created by fanxiaobin on 2017/4/13.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "UIViewController+CircleLoading.h"
#import "PopContentView.h"
#import <KLCPopup.h>
#import <objc/runtime.h>

#define window_subviews_tag 9483

static char popupKey;

@implementation UIViewController (CircleLoading)

-(void)updateCircleProgress:(CGFloat)progress{
    
    KLCPopup *popup =  objc_getAssociatedObject(self, &popupKey);
    LoadView *load = (LoadView *)popup.contentView;
    [load updateCircleProgress:progress];
   
}


- (void)showLoading{
    
    [self hiddenLoading];
    
    LoadView *load = [[LoadView alloc] init];
    load.tag = 10000;
    KLCPopup *popup = [PopContentView showPopContentView:load];
    popup.dimmedMaskAlpha = 0.2;
    
    objc_setAssociatedObject(self, &popupKey, popup, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (void)hiddenLoading{
    
    KLCPopup *popup =  objc_getAssociatedObject(self, &popupKey);
    [popup dismiss:YES];

}

@end
