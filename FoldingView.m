//
//  FoldingView.m
//  POPAnimation01
//
//  Created by hebe on 17/10/6.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import "FoldingView.h"

#import "Node.h"
#import "LinkedList.h"

@interface FoldingView(){
    LinkedList*         _list;
    Node*               _currentNode;
    
    CGFloat             _cellHeight;
    CGFloat             _frameWidth;
}
@end
@implementation FoldingView


-(instancetype)initWithFrameWidth:(CGFloat)frameWidth CellHeight:(CGFloat)cellHeight{
    self = [super init];
    if(self){
        _list           = [[LinkedList alloc]init];
        _cellHeight     = cellHeight;
        _frameWidth     = frameWidth;
    }
    return self;
}
-(void)addCellView:(id<BasicRollingViewProtocol>) cellView{
    //添加到list
    [_list addItem:cellView];
    
    [self resetFrame:_list.numberOfNodes];
    
    [cellView mainView].layer.position = CGPointMake(_frameWidth*0.5f , (_list.numberOfNodes-1) *_cellHeight );

    [self addSubview: [cellView mainView]];

}


-(id)nextObject{
    
    return nil;
}

-(void)resetIterator{
    
}


#pragma mark  private 方法


-(void)resetFrame:(NSInteger)count{
    CGPoint lp=  self.layer.position;
    self.frame = CGRectMake(0, 0, _frameWidth, count*_cellHeight);
    self.layer.position = lp;
}


@end
