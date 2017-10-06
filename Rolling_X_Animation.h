//
//  Rolling_X_Animation.h
//  POPAnimation01
//
//  Created by hebe on 17/10/5.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RolingAnimationProtocol.h"
#import "UIKit/UIKit.h"
@interface Rolling_X_Animation : NSObject<RolingAnimationProtocol>

//SETTER
-(void)setCycletime:(CGFloat)cycTime;
-(void)setAddedValue:(CGFloat)addedValue;
@end
