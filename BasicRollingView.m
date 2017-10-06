//
//  BasicRollingView.m
//  POPAnimation01
//
//  Created by hebe on 17/10/5.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import "BasicRollingView.h"
#import "LayerParameters.h"
#import "PrepareToRollingAnimation.h"
#import "ChangeViewAnchorPointAndPosition.h"
#import "PrepareToRollingAnimation.h"
#import "RotationTimerCalculator.h"

@interface BasicRollingView(){
    //layer角度
    CGFloat                             _currentLayerAngleX;            //取值范围[0，PI＊2)
    CGFloat                             _currentLayerAngelY;            //取值范围[0，PI＊2)
    CGFloat                             _currentLayerAngelZ;            //取值范围[0，PI＊2)
    //layer视图分类
    LayerCurrentAngleCategory           _layerCurrentAngleCategory;
    RotationDirection                   _rotationdirction;
    
    //主要视图
    UIView*                             _mainView;
    //辅助功能类
    ChangeViewAnchorPointAndPosition*   _changeAP;
    PrepareToRollingAnimation*          _prepare;
    RotationTimerCalculator*            _timeCalculate;
    POPBasicAnimation*                  _anim;
    id<RolingAnimationProtocol>         _rollinganim;
    
}
@end
@implementation BasicRollingView


/**
 初始化
 @param frame frame
 @return self
 */
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super init];
    if(self){
        _mainView                   = [[UIView alloc]initWithFrame:frame];
        _mainView.layer.anchorPoint = _TopCenter;
    }
    return self;
}


#pragma mark Protocol方法:返回参数
-(RotationDirection)rotationdirction{
    return _rotationdirction;
}

-(CGFloat)layerCurrentAnlge{
    return _currentLayerAngleX;
}
-(UIView *)mainView{
    return _mainView;
}


/**
 添加动画
 @param anim id<RolingAnimationProtocol
 @param key KEY
 */
-(void) addRollingAnimation:(id<RolingAnimationProtocol>)anim forKey:(NSString*)key{
    //step1: 获取参数
    _rollinganim      = anim;
    [anim setFromValue:_currentLayerAngleX];
    _rotationdirction = [anim rotationDirection];
   
    
    //设置动画参数

    [self initAssistClass];
    //计算时间
    _timeCalculate   = [[RotationTimerCalculator alloc]initWithRollingAnimation:anim];
    [_prepare prepareToRotation];
     _anim            =  [anim rollingAnimation];
    [_mainView.layer pop_addAnimation:_anim forKey:key];
    //辅助方法开始工作
    [self assistFunction];
}

-(void)assistFunction{
    [_rollinganim setAnimationCompleted:NO];
    
        for (int i=0; i<_timeCalculate.eventimeArray.count; i++) {
            [self performSelector:@selector(even) withObject:self afterDelay:[_timeCalculate.eventimeArray[i] floatValue] ];
        }
        for (int i=0 ; i<_timeCalculate.uneventimeArray.count; i++) {
            [self performSelector:@selector(uneven) withObject:self afterDelay:[_timeCalculate.uneventimeArray[i] floatValue] ];
        }
        [self performSelector:@selector(finishedBlock) withObject:self afterDelay: _timeCalculate.totaltime ];
}


/**
 空实现，在子类中实现
 */
-(void)Function_M_PI_2{
    
}

/**
 空实现，在子类中实现
 */
-(void)Function_M_PI{
    
}


/**
 执行到M_PI_2的奇数倍调用的函数
 */
-(void)uneven{
    [self Function_M_PI_2];
}

/**
 执行到M_PI_2的奇数倍调用的函数
 */
-(void)even{
    [_changeAP changeAnchorPointAndPosition];
    [self Function_M_PI];
}

-(void)finishedBlock{
    _currentLayerAngleX = _currentLayerAngleX + [_rollinganim addedValue];
    while (_currentLayerAngleX>=(M_PI*2.f)) {
        _currentLayerAngleX = _currentLayerAngleX-M_PI*2.f;
    }
    while (_currentLayerAngleX<0.f) {
        _currentLayerAngleX = _currentLayerAngleX+ M_PI*2.f;
    }
    [_rollinganim setAnimationCompleted:YES];
}

/**
 初始化辅助功能类
 */
-(void)initAssistClass{
    _changeAP = [[ChangeViewAnchorPointAndPosition alloc] initWithRollingView:self];
    _prepare  = [[PrepareToRollingAnimation alloc]initWithRollingView:self];
}



@end
