//
//  Queue.h
//  LeetCode
//
//  Created by WAYNE SMALL on 8/22/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject

@property (nonatomic, readonly) BOOL isEmpty;

- (id)dequeue;
- (void)enqueue:(id)object;

@end
