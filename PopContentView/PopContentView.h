//
//  PopContentView.h
//  CustomPopContentView
//
//  Created by fanxiaobin on 2017/4/6.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class KLCPopup;

@interface PopContentView : NSObject

+ (KLCPopup *)showPopContentView:(UIView *)contentView;

@end
