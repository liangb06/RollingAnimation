//
//  LinkedList.m
//  LinkedList
//
//  Created by YouXianMing on 15/11/15.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import "LinkedList.h"

@interface LinkedList ()

@property (nonatomic, strong) Node       *headNode;
@property (nonatomic)         NSInteger   numberOfNodes;

@end

@implementation LinkedList

- (instancetype)init{
    
    self = [super init];
    if (self) {
    
        self.headNode = [Node new];
    }
    
    return self;
}

- (void)addItem:(id)item {

    if (self.headNode == nil) {
        
        // 创建头结点
        self.headNode = [Node nodeWithItem:item];
        
    } else {
    
        [self addItem:item node:self.headNode];
    }
    
    self.numberOfNodes++;
}

#pragma mark - 私有方法
- (void)addItem:(id)item node:(Node *)node {

    if (node.nextNode == nil) {
        
        node.nextNode = [Node nodeWithItem:item];
        
    } else {
    
        [self addItem:item node:node.nextNode];
    }
}

@end
