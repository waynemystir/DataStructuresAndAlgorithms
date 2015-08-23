//
//  AddTwoNumbers.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/20/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "AddTwoNumbers.h"
#import "NodeLL.h"
#import "LinkedList.h"

@implementation AddTwoNumbers

- (void)runTheProblem {
    LinkedList *l1 = [[LinkedList alloc] initWithHead:nil nsComparator:^NSComparisonResult(id obj1, id obj2) {
        NSUInteger num1 = [obj1 integerValue];
        NSUInteger num2 = [obj2 integerValue];
        return num1 == num2 ? NSOrderedSame : num1 > num2 ? NSOrderedDescending : NSOrderedAscending;
    }];
    LinkedList *l2 = [LinkedList new];
    
    [l1 appendObject:[NSNumber numberWithInteger:3]];
    [l1 appendObject:[NSNumber numberWithInteger:5]];
    [l1 appendObject:[NSNumber numberWithInteger:7]];
//    [l1 removeObject:[NSNumber numberWithInteger:5]];
    [l1 traverse];
    NSLog(@"\n");
    
    [l2 appendObject:[NSNumber numberWithInteger:4]];
    [l2 appendObject:[NSNumber numberWithInteger:6]];
    [l2 appendObject:[NSNumber numberWithInteger:8]];
    [l2 traverse];
    NSLog(@"\n");
    
    LinkedList *la = [[LinkedList alloc] initWithHead:[self addTwoNumbers:l1.head l2:l2.head] nsComparator:nil];
    [la traverse];
}

- (NodeLL *)addTwoNumbers:(NodeLL *)l1 l2:(NodeLL *)l2 {
    NodeLL *dummyHead = [NodeLL new];
    NodeLL *p = l1, *q = l2, *curr = dummyHead;
    NSUInteger carry = 0;
    while (p || q ) {
        NSUInteger x = [p.object integerValue];
        NSUInteger y = [q.object integerValue];
        NSUInteger digit = carry + x + y;
        carry = digit / 10;
        curr.next = [[NodeLL alloc] initWithObject:[NSNumber numberWithInteger:(digit % 10)]];
        curr = curr.next;
        if (p) p = p.next;
        if (q) q = q.next;
    }
    if (carry > 0) {
        curr.next = [[NodeLL alloc] initWithObject:[NSNumber numberWithInteger:carry]];
    }
    
    return dummyHead.next;
}

@end
