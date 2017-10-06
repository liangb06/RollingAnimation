//
//  PrepareToRollingAnimation.h
//  POPAnimation01
//
//  Created by hebe on 17/10/5.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "LayerParameters.h"
#import "BasicRollingViewProtocol.h"
@interface PrepareToRollingAnimation : NSObject{
    
}

@property(nonatomic,weak) id<BasicRollingViewProtocol> rollingView;



/**
 初始化

 @param rollingView <id>BasicRollingViewProtocol
 @return self
 */
-(instancetype)initWithRollingView:(id<BasicRollingViewProtocol>)rollingView;

/**
 根据视图的旋转方向，和视图的当前角度，对视图的anchorPoint和Postion进行设置
 */
-(void)prepareToRotation;





@end
