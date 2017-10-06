//
//  FoldingViewController.m
//  POPAnimation01
//
//  Created by hebe on 17/10/6.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import "FoldingViewController.h"
@interface FoldingViewController(){
    
    FoldingCellView*                _cell01;
    FoldingCellView*                _cell02;
    FoldingCellView*                _cell03;
    FoldingCellView*                _cell04;

    FoldingViewAnimationContoller*  _animContol;
    NSArray*                        _animArray;
    
    CGRect              _cellFrame;
}

@end

@implementation FoldingViewController




-(instancetype)init{
    self = [super init];
    if(self){
        _position = CGPointMake(0.f, 0.f);
        [self initFoldingView];
        [self initCells];
        [self addcells];
        [self initAnimationController];
    }
    return self;
}


/**
 重写position的setter方法

 @param position position
 */
-(void)setPosition:(CGPoint)position{
    _position = position;
    _fv.layer.position =position;
}


-(void)folding{
    [_animContol foldingset];
     [self startAnimation];
    
}


-(void)unfolding{

    [_animContol unfoldingset];
    [self startAnimation];
}

-(void)startAnimation{
    
//    [_cell01 addRollingAnimation:_animArray[0] forKey:nil];
    [_cell02 addRollingAnimation:_animArray[1] forKey:nil];
    [_cell03 addRollingAnimation:_animArray[2] forKey:nil];
    [_cell04 addRollingAnimation:_animArray[3] forKey:nil];
}






#pragma mark 私有方法
-(void) initFoldingView{
    _fv = [[FoldingView alloc] initWithFrameWidth:300.f CellHeight:80];
    _fv.layer.anchorPoint = CGPointMake(0.5f, 0.f);
    _fv.layer.position = _position;
    _fv.backgroundColor = [UIColor blackColor];
    _cellFrame  = CGRectMake(2, 0, 296.f, 80.f);
}

-(void) initCells{
    _cell01 = [[FoldingCellView alloc]initWithFrame:_cellFrame];
    _cell02 = [[FoldingCellView alloc]initWithFrame:_cellFrame];
    _cell03 = [[FoldingCellView alloc]initWithFrame:_cellFrame];
    _cell04 = [[FoldingCellView alloc]initWithFrame:_cellFrame];
    _cell01.mainView.backgroundColor = [UIColor redColor];
    _cell02.mainView.backgroundColor = [UIColor grayColor];
    _cell03.mainView.backgroundColor = [UIColor greenColor];
    _cell04.mainView.backgroundColor = [UIColor yellowColor];
    _cell01.mainView.layer.zPosition = 10.f;
    _cell02.mainView.layer.zPosition = 20.f;
    _cell03.mainView.layer.zPosition = 30.f;
    _cell04.mainView.layer.zPosition = 40.f;

    
    
}


-(void)addcells{
    [_fv addCellView:_cell01];
    [_fv addCellView:_cell02];
    [_fv addCellView:_cell03];
    [_fv addCellView:_cell04];
}

-(void)initAnimationController{
    _animContol = [[FoldingViewAnimationContoller alloc]init];
    _animArray  = [_animContol getAnimArray];
    
}




@end
