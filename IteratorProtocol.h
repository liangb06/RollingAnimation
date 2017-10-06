//
//  IteratorProtocol.h
//  LinkedList
//
//  Created by YouXianMing on 15/11/15.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IteratorProtocol <NSObject>

@required
/**
 *  下一个对象
 *
 *  @return 对象
 */
- (id)nextObject;

/**
 *  重置迭代器(重置指针)
 */
- (void)resetIterator;

@end
