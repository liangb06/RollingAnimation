//
//  PrepareToRollingAnimation.m
//  POPAnimation01
//
//  Created by hebe on 17/10/5.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import "PrepareToRollingAnimation.h"
@interface PrepareToRollingAnimation(){
    LayerCurrentAngleCategory   _layerCategory;
    UIView*                     _tempView;
    RotationDirection           _rotationDirection;
    CGFloat                     _layerAngle_UD;
    CGFloat                     _layerAngle_LR;
}
@end
@implementation PrepareToRollingAnimation


/**
 便利初始化
 @return self
 */

-(instancetype)initWithRollingView:(id<BasicRollingViewProtocol>)rollingView{
    self = [super init];
    if(self){
        [self setRollingView:rollingView];
    }
    return self;
}

-(instancetype)init{
    self = [super init];
    if(self){
        //设置默认值
        _rotationDirection = Rolling_UP;
        _layerAngle_LR     = 0.f;
        _layerAngle_UD     = 0.f;
    }
    return self;
}



/**
 初始化参数

 @param rollingView BasicRollingViewProtocol
 */
-(void)setRollingView:(id<BasicRollingViewProtocol>)rollingView{
    _rollingView        = rollingView;
    _rotationDirection  = [rollingView  rotationdirction];
    _tempView           = [rollingView mainView];
    _layerAngle_UD      = [rollingView layerCurrentAnlge];
}

-(void)prepareToRotation{
    if(_rollingView){
        switch (_rotationDirection) {
            case Rolling_UP:
            case Rolling_Down:
                [self classifyLayerAngle_UD];
                [self prepareToRotationForUD];
                break;
            case Rolling_Left:
            case Rolling_Right:
                [self classifyLayerAngle_LR];
                [self prepareToRotationForLR];
                break;
            default:
                break;
        }
        
    }
}




#pragma mark private方法

/**
 视图上下旋转
 */
-(void)prepareToRotationForUD{
    CGPoint point01 = CGPointMake(_tempView.layer.position.x, _tempView.frame.origin.y);
    CGPoint point02 = CGPointMake(_tempView.layer.position.x, _tempView.frame.origin.y+_tempView.frame.size.height);
    switch (_layerCategory) {
        case CASE_ZERO:                             //特殊处理
            if(_rotationDirection == Rolling_UP) {
                _tempView.layer.anchorPoint = _TopCenter;
                _tempView.layer.position    = point01;
            }
            else if (_rotationDirection == Rolling_Down){
                _tempView.layer.anchorPoint = _BottomCenter;
                _tempView.layer.position    = point02;
            }
            break;
        case CASE_ZERO_MPI2:
            _tempView.layer.anchorPoint = _TopCenter;
            _tempView.layer.position    = point01;
            break;
        case CASE_MPI2:
            _tempView.layer.anchorPoint = _TopCenter;
            _tempView.layer.position    = point01;
            break;
        case CASE_MPI2_MPI:
            _tempView.layer.anchorPoint = _TopCenter;
            _tempView.layer.position    = point02;
            break;
        case CASE_MPI:                              //特殊处理
            if(_rotationDirection == Rolling_UP) {
                _tempView.layer.anchorPoint = _BottomCenter;
                _tempView.layer.position    = point01;
            }
            else if (_rotationDirection == Rolling_Down){
                _tempView.layer.anchorPoint = _TopCenter;
                _tempView.layer.position    = point02;
            }
            break;
        case CASE_MPI_M3PI2:
            _tempView.layer.anchorPoint = _BottomCenter;
            _tempView.layer.position    = point01;
            break;
        case CASE_M3PI2:
            _tempView.layer.anchorPoint = _BottomCenter;
            _tempView.layer.position    = point02;
            break;
        case CASE_M3PI2_M2PI:
            _tempView.layer.anchorPoint = _BottomCenter;
            _tempView.layer.position    = point02;
            break;
        default:
            break;
    }
}

/**
 视图左右旋转
 */
-(void)prepareToRotationForLR{
    NSLog(@"%@", @"待实现");
}



/**
 对视图的当前角度进行分类——上下
 */
-(void) classifyLayerAngle_UD{
    [self classifyLayerAngle:_layerAngle_UD];
}
/**
 对视图的当前角度进行分类——左右
 */
-(void) classifyLayerAngle_LR{
    
    [self classifyLayerAngle:_layerAngle_LR];
}


/**
 视图分类
 @param angle 上下／左右
 */
-(void) classifyLayerAngle:(CGFloat)angle{
    if(angle==0.f){
        _layerCategory = CASE_ZERO ;        //0.f
    }
    else if(angle <M_PI_2){
        _layerCategory = CASE_ZERO_MPI2;    //(0.f, PI/2)
    }
    else if(angle == M_PI_2){
        _layerCategory = CASE_MPI2;         // PI/2
    }
    else if(angle <M_PI){
        _layerCategory = CASE_MPI2_MPI;     // (PI/2, PI)
    }
    else if(angle ==M_PI){
        _layerCategory = CASE_MPI;          // PI
    }
    else if(angle < M_PI_2*3.f){
        _layerCategory = CASE_MPI_M3PI2;    // (PI, PI*3/2)
    }
    else if (angle == M_PI_2*3.f){
        _layerCategory = CASE_M3PI2;        // PI*3/2
    }
    else {
        _layerCategory = CASE_M3PI2_M2PI;   //(PI*3/2, PI*2)
    }
    
    
}



@end
