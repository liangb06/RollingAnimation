//
//  RotationTimerCalculator.h
//  vm
//
//  Created by hebe on 17/10/4.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RolingAnimationProtocol.h"
@interface RotationTimerCalculator : NSObject




/**
 返回值:时间数组:M_PI_2的奇数倍
 */
@property(nonatomic,strong) NSArray *uneventimeArray;//奇数
/**
 返回值:时间数组:M_PI_2的偶数倍
 */
@property(nonatomic,strong) NSArray *eventimeArray;  //偶数
@property(nonatomic) CGFloat remainTime;
@property(nonatomic) CGFloat totaltime;
-(instancetype)initWithRollingAnimation:(id<RolingAnimationProtocol>)rollingAnim;
@end
