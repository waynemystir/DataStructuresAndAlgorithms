//
//  SwapNodesInPairs.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/20/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "SwapNodesInPairs.h"
#import "NodeLL.h"
#import "LinkedList.h"

@implementation SwapNodesInPairs

- (void)runTheProblem {
    LinkedList *ll = [LinkedList new];
    [ll addObject:[NSNumber numberWithInteger:7]];
    [ll addObject:[NSNumber numberWithInteger:8]];
    [ll addObject:[NSNumber numberWithInteger:5]];
    [ll addObject:[NSNumber numberWithInteger:6]];
    [ll addObject:[NSNumber numberWithInteger:3]];
    [ll addObject:[NSNumber numberWithInteger:4]];
    [ll traverse];
    NSLog(@"\n");
    
    NodeLL *nh = [self swapPairs:ll.head];
    [ll traverse];
    NSLog(@"\n");
    
    LinkedList *nl = [[LinkedList alloc] initWithHead:nh nsComparator:nil];
    [nl traverse];
}

- (NodeLL *)swapPairs:(NodeLL *)head {
    NodeLL *provisional = [NodeLL new];
    provisional.next = head;
    NodeLL *p = head;
    NodeLL *prev = provisional;
    while (p && p.next) {
        NodeLL *q = p.next, *r = p.next.next;// p=4 q=3 r=6 prev=provis prev.next = 4
        prev.next = q;// prev.next = 3
        q.next = p;// q.next = 4
        p.next = r;// p.next = 6
        prev = p;// prev = 4
        p = r;// p = 6
    }
    return provisional.next;
}

@end
