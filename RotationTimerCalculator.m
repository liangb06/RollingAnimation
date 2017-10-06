
//
//  RotationTimerCalculator.m
//  vm
//
//  Created by hebe on 17/10/4.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import "RotationTimerCalculator.h"
@interface RotationTimerCalculator(){
    /**
     返回值:时间数组:M_PI_2的奇数倍
     */
    NSMutableArray*                 _uneventimeArray;//奇数
    /**
     返回值:时间数组:M_PI_2的偶数倍
     */
    NSMutableArray*                 _eventimeArray;  //偶数
    
    id<RolingAnimationProtocol>     _rollingAnim;
    
    CGFloat                         _startAngle;
    CGFloat                         _addedAngle;
    CGFloat                         _cycleTime;
    CGFloat                         _delayTime;
}

@end
@implementation RotationTimerCalculator


-(instancetype)initWithRollingAnimation:(id<RolingAnimationProtocol>)rollingAnim{
    self = [super init];
    if(self){
        _rollingAnim = rollingAnim;
        _eventimeArray = [[NSMutableArray alloc]init];
        _uneventimeArray = [[NSMutableArray alloc]init];
        [self setTimeArray];
    }
    return self;
}

-(void) setTimeArray{
    _addedAngle = [_rollingAnim addedValue];
    _cycleTime  = [_rollingAnim cycleTime];
    _startAngle = [_rollingAnim fromeValue];
    _delayTime  = [_rollingAnim getDelayTime];
    //如果周期为零，或者旋转角度为零，则返回空值；
    if(_cycleTime != 0.f && _addedAngle != 0.f){
        //计算时间： PI_2的偶数倍的间隔时间
        //计算时间： PI_2的奇数倍的间隔时间
        // 大于零
        _totaltime = fabs(_addedAngle*_cycleTime/M_PI)+_delayTime;
        if(_addedAngle >0.f){

            int a = (int)floor(_startAngle/M_PI_2);
            
            int b = (int) floor(_startAngle/M_PI_2 + _addedAngle/M_PI_2);
            
            
            for(int i=(a+1); i<=b ;i++){
                
                if(i%2==0){
                    //M_PI_2的偶数倍
                    [_eventimeArray addObject:@(i*.5f*_cycleTime - _startAngle*_cycleTime/M_PI +_delayTime)];
                }else{
                    //M_PI_2的奇数倍
                    [_uneventimeArray addObject:@(i*.5f*_cycleTime- _startAngle*_cycleTime/M_PI +_delayTime)];
                }

            };
            
            if(b%2==0 ){
                self.remainTime= (_startAngle+ _addedAngle - b*M_PI_2)*_cycleTime/M_PI+_delayTime;
            }else{
                self.remainTime = (_startAngle + _addedAngle - b*M_PI_2 + M_PI_2)*_cycleTime/M_PI+_delayTime;
            }
            
  
            
        }
        //小于零
        else{

            int a =  (int) ceil(_startAngle/M_PI_2);
            int b =  (int) ceil(_startAngle/M_PI_2+ _addedAngle/M_PI_2);
            for (int i = (a-1); i>=b; i--) {
                if(i%2==0){
                    //M_PI_2的奇数倍
                    [_eventimeArray addObject:@(-i*.5f*_cycleTime + _startAngle*_cycleTime/M_PI+_delayTime)];
                }else{
                    //M_PI_2的偶数倍
                    [_uneventimeArray   addObject:@(-i*.5f*_cycleTime + _startAngle*_cycleTime/M_PI+_delayTime)];
                }
            }
            if(b%2==0 ){
                self.remainTime =  -(_startAngle + _addedAngle - b*M_PI_2)*_cycleTime/M_PI+_delayTime;
            }else{
                self.remainTime = (-(_startAngle + _addedAngle - b*M_PI_2 )+ M_PI_2)*_cycleTime/M_PI+_delayTime;
            }
 
        }
    
    }
}

@end
