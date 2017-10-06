//
//  RolingAnimationProtocol.h
//  POPAnimation01
//
//  Created by hebe on 17/10/5.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LayerParameters.h"
#import "UIKit/UIKit.h"
#import "POP/POP.h"
@protocol RolingAnimationProtocol <NSObject>

@required

//RETURN
-(RotationDirection) rotationDirection;
-(POPBasicAnimation*) rollingAnimation;
-(CGFloat) addedValue;
-(CGFloat) cycleTime;
-(CGFloat) fromeValue;
-(CGFloat) getDelayTime;
-(void)    setDelayTime:(CGFloat)delayTime;
-(BOOL)    animationCompleted;
-(void)    setFromValue:(CGFloat)fromValue;
-(void)    setAnimationCompleted:(BOOL)complete;
@end
