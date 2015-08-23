//
//  LinkedList.m
//  DataStructuresAlgorithmsObjC
//
//  Created by WAYNE SMALL on 8/19/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "LinkedList.h"

@implementation LinkedList

- (id)initWithHead:(id)object nsComparator:(NSComparator)nsComparator {
    if (self = [super init]) {
        _head = object;
        _nsComparator = nsComparator;
    }
    return self;
}

- (BOOL)isEmpty {
    return self.head == nil;
}

- (void)addObject:(id)object {
    if (!object) {
        return;
    }
    
    NodeLL *newNode = [[NodeLL alloc] initWithObject:object];
    
    if (!self.isEmpty) {
        newNode.next = self.head;
    }
    
    self.head = newNode;
}

- (void)appendObject:(id)object {
    if (!object) {
        return;
    }
    
    NodeLL *newNode = [[NodeLL alloc] initWithObject:object];
    
    if (self.isEmpty) {
        self.head = newNode;
    } else {
        NodeLL *node = self.head;
        while (node.next) { node = node.next; }
        node.next = newNode;
        newNode.prev = node;
    }
}

- (void)traverse {
    NodeLL *node = self.head;
    while (node) {
        [self processNode:node];
        node = node.next;
    }
}

- (void)processNode:(NodeLL *)node {
    NSLog(@"%@%@", NSStringFromSelector(_cmd), node.object);
}

- (NodeLL *)find:(id)object {
    if (self.isEmpty || !self.nsComparator) {
        return nil;
    }
    
    NodeLL *node = self.head;
    
    while (node) {
        if (self.nsComparator(object, node.object) == NSOrderedSame) {
            return node;
        }
        node = node.next;
    }
    
    return node;
}

- (NodeLL *)removeObject:(id)object {
    NodeLL *node = [self find:object];
    
    NodeLL *prev = node.prev;
    NodeLL *next = node.next;
    
    if (prev) {
        prev.next = next;
    } else {
        self.head = next;
    }
    
    if (next) {
        next.prev = prev;
    }
    
    return node;
}

@end
