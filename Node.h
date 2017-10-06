//
//  Node.h
//  LinkedList
//
//  Created by YouXianMing on 15/11/15.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

/**
 *  指向下一个节点
 */
@property (nonatomic, strong) Node  *nextNode;

/**
 *  节点挂载的对象
 */
@property (nonatomic, weak)   id     item;

/**
 *  便利构造器
 *
 *  @param item 节点挂载的对象
 *
 *  @return Node对象
 */
+ (instancetype)nodeWithItem:(id)item;

@end
