//
//  FoldingView.h
//  POPAnimation01
//
//  Created by hebe on 17/10/6.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "RolingAnimationProtocol.h"
#import "BasicRollingViewProtocol.h"
#import "IteratorProtocol.h"
@interface FoldingView : UIView<IteratorProtocol>

-(instancetype)initWithFrameWidth:(CGFloat)frameWidth CellHeight:(CGFloat)cellHeight;
-(void)addCellView:(id<BasicRollingViewProtocol>) cellView;
@end
