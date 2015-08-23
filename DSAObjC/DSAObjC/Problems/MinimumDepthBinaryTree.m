//
//  MinimumDepthBinaryTree.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/22/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/*
 
 Question:
 Given a binary tree, find its minimum depth.
 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
 
 */

#import "MinimumDepthBinaryTree.h"
#import "NodeBST.h"
#import "BinarySearchTree.h"
#import "Queue.h"

@implementation MinimumDepthBinaryTree

- (void)runTheProblem {
    NSComparator nsc = ^NSComparisonResult(id obj1, id obj2) {
        NSString *string1 = (NSString *)obj1;
        NSString *string2 = (NSString *)obj2;
        return [string1 compare:string2 options:NSLiteralSearch|NSNumericSearch|NSCaseInsensitiveSearch];
    };
    
    BinarySearchTree *bst = [[BinarySearchTree alloc] initWithRoot:nil nsComparator:nsc];
    
    [bst insertObject:@"def"];
    [bst insertObject:@"abc"];
    [bst insertObject:@"ghi"];
    [bst insertObject:@"jkl"];
    [bst insertObject:@"mno"];
    [bst insertObject:@"stu"];
    [bst insertObject:@"pqr"];
    [bst insertObject:@"vwx"];
    
    NSLog(@"%@: minDepth:%lu TC:%f", self.class, [self minDepth:bst.root], timeComplexity);
}

- (NSUInteger)minDepth:(NodeBST *)root {
    if (!root) return 0;
    Queue *q = [Queue new];
    [q enqueue:root];
    NodeBST *rightMost = root;
    NSUInteger depth = 1;
    while (!q.isEmpty) {
        timeComplexity++;
        NodeBST *node = [q dequeue];
        if (!node.left && !node.right) break;
        if (node.left) [q enqueue:node.left];
        if (node.right) [q enqueue:node.right];
        if (node == rightMost) {
            depth++;
            rightMost = node.right ? : node.left;
        }
    }
    return depth;
}

@end
