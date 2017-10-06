//
//  Rolling_X_Animation.m
//  POPAnimation01
//
//  Created by hebe on 17/10/5.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import "Rolling_X_Animation.h"

@interface Rolling_X_Animation(){
    CGFloat             _fromValue;
    CGFloat             _addedValue;
    CGFloat             _cycleTime;
    BOOL                _animationCompleted;
    RotationDirection   _rotationDirection;
    CGFloat             _delayTime;
    
}
@property(nonatomic,strong) POPBasicAnimation *animation;
@end
@implementation Rolling_X_Animation

-(instancetype)init{
    self = [super init];
    if(self){
        [self initParametes];
        [self initAnimation];
    }
    return self;
}


#pragma mark protocol 方法

-(void)setAnimationCompleted:(BOOL)complete{
    _animationCompleted = complete;
}
/**
 设置动画参数
 @param fromValue fromvalue
 */
-(void)setFromValue:(CGFloat)fromValue{
    _fromValue = fromValue;
    _animation.fromValue = @(fromValue);
    _animation.toValue   = @(fromValue+ _addedValue);
}

-(CGFloat)getDelayTime{
    return _delayTime;
}
-(void)setDelayTime:(CGFloat)delayTime{
    _delayTime = delayTime;
}
//RETURN方法

-(RotationDirection)rotationDirection{
    return _rotationDirection;
}
-(POPBasicAnimation *)rollingAnimation{
    _animation.fromValue = @(_fromValue);
    _animation.toValue   = @(_fromValue+_addedValue);
    _animation.duration  = fabs(_addedValue/M_PI*_cycleTime) ;
    _animation.beginTime = CACurrentMediaTime() +_delayTime;
    return _animation;
}
-(CGFloat)addedValue{
    return _addedValue;
}
-(CGFloat)cycleTime{
    return _cycleTime;
}
-(CGFloat)fromeValue{
    return _fromValue;
}
-(BOOL)animationCompleted{
    return _animationCompleted;
}
#pragma mark public 方法
//SETTER

/**
 设置动画单次循环时间
 @param cycTime 单次循环时间
 */
-(void)setCycletime:(CGFloat)cycTime{
    _cycleTime = cycTime;
}

/**
 设置动画旋转角度
 @param addedValue 动画角度
 */
-(void)setAddedValue:(CGFloat)addedValue{
    _addedValue = addedValue;
    if(addedValue>0.f){
        _rotationDirection = Rolling_UP;
    }else{
        _rotationDirection = Rolling_Down;
    }
}

//-(void)setBeginTime:(CGFloat)timeDelay{
//    _animation.beginTime = timeDelay*_cycleTime;
//    NSLog(@"%f", timeDelay*_cycleTime );
//}
#pragma mark 私有方法
/**
 初始化animation，设定默认值
 */
-(void) initAnimation{
    //初始化动画
    _animation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotationX];
    _animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    _animation.removedOnCompletion = YES;
    _animationCompleted = YES;
}
/**
 初始化参数:设置默认值
 */
-(void)initParametes{
    _rotationDirection  = Rolling_UP;
    _fromValue          = 0.f;
    _addedValue         = M_PI;
    _cycleTime          = 0.3f;
}

@end
