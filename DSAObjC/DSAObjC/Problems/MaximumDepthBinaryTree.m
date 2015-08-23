//
//  MaximumDepthBinaryTree.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/22/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/*
 
 Given a binary tree, find its maximum depth.
 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 
 */

#import "MaximumDepthBinaryTree.h"
#import "NodeBST.h"
#import "BinarySearchTree.h"

@implementation MaximumDepthBinaryTree

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
    
    NSLog(@"%@: maxDepth:%lu TC:%f", self.class, [self maxDepth:bst.root], timeComplexity);
}

- (NSUInteger)maxDepth:(NodeBST *)node {
    if (!node) return 0;
    timeComplexity++;
    return MAX([self maxDepth:node.left], [self maxDepth:node.right]) + 1;
}

@end
