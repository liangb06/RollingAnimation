//
//  FoldingViewAnimationContoller.m
//  POPAnimation01
//
//  Created by hebe on 17/10/6.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import "FoldingViewAnimationContoller.h"
#import "Rolling_X_Animation.h"
@interface FoldingViewAnimationContoller(){
    NSArray *               _animArray;
    
    Rolling_X_Animation*    _cell01Anim;
    Rolling_X_Animation*    _cell02Anim;
    Rolling_X_Animation*    _cell03Anim;
    Rolling_X_Animation*    _cell04Anim;
    CGFloat                 _cycTime;
 
}
@end


@implementation FoldingViewAnimationContoller

-(instancetype)init{
    self = [super init];
    if(self){
        [self initAnim];
    }
    return self;
}

-(void)initAnim{
    _cell01Anim = [[Rolling_X_Animation alloc]init];
    _cell02Anim = [[Rolling_X_Animation alloc]init];
    _cell03Anim = [[Rolling_X_Animation alloc]init];
    _cell04Anim = [[Rolling_X_Animation alloc]init];
    _cycTime   = 0.3f;
    [_cell01Anim setCycletime:_cycTime];
    [_cell02Anim setCycletime:_cycTime];
    [_cell03Anim setCycletime:_cycTime];
    [_cell04Anim setCycletime:_cycTime];

    _animArray = [NSArray arrayWithObjects:_cell01Anim,_cell02Anim,_cell03Anim,_cell04Anim, nil];
    
}

-(void)unfoldingset{
    
    
    [_cell04Anim setAddedValue:-M_PI*3.f];
    [_cell03Anim setAddedValue:-M_PI*2.f];
    [_cell02Anim setAddedValue:-M_PI*1.f];
    
    [_cell02Anim setDelayTime:  0.f];
    [_cell03Anim setDelayTime:  0.f];

    
}
-(void)foldingset{
    
    [_cell04Anim setAddedValue:M_PI*3.f];
    [_cell03Anim setAddedValue:M_PI*2.f];
    [_cell02Anim setAddedValue:M_PI*1.f];
    [_cell02Anim setDelayTime:  _cycTime* 2.f];
    [_cell03Anim setDelayTime:  _cycTime];
    
    
}
-(NSArray*) getAnimArray{
    return _animArray;
}





@end
