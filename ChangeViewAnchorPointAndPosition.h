//
//  ChangeViewAnchorPointAndPosition.h
//  POPAnimation01
//
//  Created by hebe on 17/10/5.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "LayerParameters.h"
#import "BasicRollingViewProtocol.h"
@interface ChangeViewAnchorPointAndPosition : NSObject
@property(nonatomic,weak) id <BasicRollingViewProtocol> rollingView;


-(instancetype)initWithRollingView:(id<BasicRollingViewProtocol>)rollingView;
/**
 改变AnchorPoint 和Postion的方法:前提是设置给rollingView赋值后
 */
-(void)changeAnchorPointAndPosition;
@end
