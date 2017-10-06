//
//  ChangeViewAnchorPointAndPosition.m
//  POPAnimation01
//
//  Created by hebe on 17/10/5.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import "ChangeViewAnchorPointAndPosition.h"

@interface ChangeViewAnchorPointAndPosition(){
    RotationDirection _direction;
    UIView* _view;
}
@end

@implementation ChangeViewAnchorPointAndPosition



-(instancetype)initWithRollingView:(id<BasicRollingViewProtocol>)rollingView{
    self = [super init];
    if(self) {
        [self setRollingView:rollingView];
    }
    return self;
}


-(void)setRollingView:(id<BasicRollingViewProtocol>)rollingView{
    _rollingView = rollingView;
    _direction   = [rollingView rotationdirction];
    _view        = [rollingView mainView];
}

-(void)changeAnchorPointAndPosition{
    if(_rollingView){
        switch (_direction) {
            case Rolling_UP:
                [self changeAnchorPointAndPositionForRotationUp];
                break;
            case Rolling_Down:
                [self changeAnchorPointAndPositionForRotationDown];
                break;
            case Rolling_Left:
                [self changeAnchorPointAndPositionForRotationLeft];
                break;
            case Rolling_Right:
                [self changeAnchorPointAndPositionForRotationRight];
                break;
                
            default:
                break;
        }
    }
}


-(void)changeAnchorPointAndPositionForRotationUp{
    CGFloat position_x = _view.layer.position.x;
    CGFloat frame_y = _view.frame.origin.y;
    if(_view.layer.anchorPoint.y ==  _TopCenter.y){
        _view.layer.anchorPoint  =   _BottomCenter;
    }else{
        _view.layer.anchorPoint  =   _TopCenter;
    }
    _view.layer.position    =   CGPointMake(position_x, frame_y);
}
-(void)changeAnchorPointAndPositionForRotationDown{
    CGFloat position_x = _view.layer.position.x;
    CGFloat frame_y_add_frameHeight = _view.frame.origin.y + _view.frame.size.height;
    if(_view.layer.anchorPoint.y ==  _TopCenter.y){
        _view.layer.anchorPoint = _BottomCenter;
    }else{
        _view.layer.anchorPoint = _TopCenter;
    }
    _view.layer.position = CGPointMake(position_x, frame_y_add_frameHeight);
}

-(void)changeAnchorPointAndPositionForRotationLeft{
    //todo
}

-(void)changeAnchorPointAndPositionForRotationRight{
    
    //todo
}



@end
