//
//  Node.m
//  LinkedList
//
//  Created by YouXianMing on 15/11/15.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import "Node.h"

@implementation Node

+ (instancetype)nodeWithItem:(id)item {

    Node *node = [[[self class] alloc] init];
    node.item  = item;
    
    return node;
}

@end
