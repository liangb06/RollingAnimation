//
//  BasicRollingViewProtocol.h
//  POPAnimation01
//
//  Created by hebe on 17/10/5.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LayerParameters.h"
@protocol BasicRollingViewProtocol <NSObject>


@required

/**
 主视图

 @return 主视图
 */
-(UIView *)mainView;

/**
 旋转方向

 @return 旋转方向
 */
-(RotationDirection) rotationdirction;

/**
 视图当前角度

 @return 视图角度
 */
-(CGFloat) layerCurrentAnlge;
@end
