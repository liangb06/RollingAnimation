//
//  BasicRollingView.h
//  POPAnimation01
//
//  Created by hebe on 17/10/5.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIkit.h"
#import "POP/POP.h"
#import "RolingAnimationProtocol.h"
#import "BasicRollingViewProtocol.h"
@interface BasicRollingView : NSObject <BasicRollingViewProtocol>

-(instancetype)initWithFrame:(CGRect)frame;

-(void) addRollingAnimation:(id<RolingAnimationProtocol>)anim forKey:(NSString*)key;

/**
 空实现，在子类中实现
 */
-(void)Function_M_PI_2;

/**
 空实现，在子类中实现
 */
-(void)Function_M_PI;

@end
