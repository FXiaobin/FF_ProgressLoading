//
//  LoadView.m
//  FF_CircleLoading
//
//  Created by fanxiaobin on 2017/4/13.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "LoadView.h"
#import "ZZCircleProgress.h"

#define window_subviews_tag 9483

@implementation LoadView

-(instancetype)init{
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.userInteractionEnabled = NO;
        
        UIView *maskBgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        maskBgView.backgroundColor = [UIColor blackColor];
        maskBgView.alpha = 0.0;
        maskBgView.userInteractionEnabled = NO;
        maskBgView.tag = window_subviews_tag;
        
        [self addSubview:maskBgView];
        
        [UIView animateWithDuration:0.2 animations:^{
            maskBgView.alpha = 0.2;
        }];
        
        UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
        blackView.backgroundColor = [UIColor colorWithRed:46/255.0 green:46/255.0 blue:46/255.0 alpha:1.0];
        blackView.clipsToBounds = YES;
        blackView.layer.cornerRadius = 6.0;
        blackView.tag = window_subviews_tag+1;
        blackView.center = self.center;
        [self addSubview:blackView];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 40, 40)];
        imageView.image = [UIImage imageNamed:@"normal"];
        [blackView addSubview:imageView];
        
        ZZCircleProgress *circle = [[ZZCircleProgress alloc] initWithFrame:CGRectMake(5, 5, 60, 60) pathBackColor:nil pathFillColor:[UIColor orangeColor] startAngle:0 strokeWidth:2.0];
        circle.tag = window_subviews_tag + 2;
        circle.showPoint = NO;
        circle.showProgressText = NO;
        circle.increaseFromLast = YES;
        circle.animationModel = CircleIncreaseByProgress;
        circle.pathBackColor = [UIColor whiteColor];
        circle.animationModel = CircleIncreaseSameTime;
        circle.progress = 0.6;
        [blackView addSubview:circle];

        
    }
    return self;
}

- (void)updateCircleProgress:(CGFloat)progress{
    UIView *blackView = [self viewWithTag:window_subviews_tag+1];
    
    ZZCircleProgress *circle = (ZZCircleProgress *)[blackView viewWithTag:window_subviews_tag + 2];
    circle.progress = progress;
    
//    if (progress >= 1.0) {
//        [self hidden];
//    }
}
//
//- (void)show{
//    
//    
//    UIWindow *window = nil;
//    window = [UIApplication sharedApplication].keyWindow;
//    if (window == nil) {
//        window = [UIApplication sharedApplication].windows.firstObject;
//    }
//    
//    [window addSubview:self];
//  
//    
//}
//
//- (void)hidden{
//    
//    [self removeFromSuperview];
//}

@end
