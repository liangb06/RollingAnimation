//
//  FoldingCellView.m
//  POPAnimation01
//
//  Created by hebe on 17/10/6.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import "FoldingCellView.h"

@interface FoldingCellView(){
    UIView*     _mainView;
    UIView*     _backView;
    RotationDirection _roationdirction;
}

@end

@implementation FoldingCellView



-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _mainView = self.mainView;
        _backView = [[UIView alloc]initWithFrame:_mainView.bounds];
        _mainView.layer.transform = [self transform3D];
        _roationdirction = self.rotationdirction;
        [_mainView addSubview:_backView];
    }
    return self;
}



-(void)Function_M_PI_2{

}


-(void)Function_M_PI{
    
}


#pragma mark - Private instance methods
-(CATransform3D)transform3D
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 2.5 / -2000;
    return transform;
}
@end
