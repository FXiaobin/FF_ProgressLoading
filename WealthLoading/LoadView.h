//
//  LoadView.h
//  FF_CircleLoading
//
//  Created by fanxiaobin on 2017/4/13.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadView : UIView


@property  (nonatomic,strong) UIView *maskBgView;

@property (nonatomic,strong) UIView *blackView;

//- (void)show;
//- (void)hidden;
- (void)updateCircleProgress:(CGFloat)progress;

@end
