//
//  LinkedList.h
//  LinkedList
//
//  Created by YouXianMing on 15/11/15.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface LinkedList : NSObject

/**
 *  头节点
 */
@property (nonatomic, strong, readonly) Node *headNode;

/**
 *  有几个节点
 */
@property (nonatomic, readonly) NSInteger  numberOfNodes;

/**
 *  节点挂载的对象
 *
 *  @param item 节点挂载的对象
 */
- (void)addItem:(id)item;

@end
