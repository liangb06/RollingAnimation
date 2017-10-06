//
//  FoldingViewController.h
//  POPAnimation01
//
//  Created by hebe on 17/10/6.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FoldingView.h"
#import "FoldingCellView.h"
#import "Rolling_X_Animation.h"
#import "FoldingViewAnimationContoller.h"

@interface FoldingViewController : NSObject
@property(nonatomic,strong)FoldingView*  fv;

@property(nonatomic)CGPoint position;
-(void)folding;
-(void)unfolding;
@end
