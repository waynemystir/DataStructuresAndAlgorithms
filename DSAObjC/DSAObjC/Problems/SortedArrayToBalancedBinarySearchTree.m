//
//  SortedArrayToBalancedBinarySearchTree.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/23/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/*
 
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
 
 */

#import "SortedArrayToBalancedBinarySearchTree.h"
#import "NodeBST.h"
#import "BinarySearchTree.h"

@implementation SortedArrayToBalancedBinarySearchTree

- (void)runTheProblem {
    NSArray *array = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13];
    NodeBST *root = [self sortedArrayToBST:array];
    BinarySearchTree *bst = [[BinarySearchTree alloc] initWithRoot:root nsComparator:^NSComparisonResult(id obj1, id obj2) {
        NSInteger num1 = [obj1 integerValue];
        NSInteger num2 = [obj2 integerValue];
        return num1 == num2 ? NSOrderedSame : num1 < num2 ? NSOrderedAscending : NSOrderedDescending;
    }];
    NSLog(@"TC:%@ tc:%f", @(timeComplexity), timeComplexity);
    [bst traverseTreeInOrder];
}

- (NodeBST *)sortedArrayToBST:(NSArray *)array {
    return [self sortedArrayToBST:array start:0 end:(array.count - 1)];
}

- (NodeBST *)sortedArrayToBST:(NSArray *)array start:(NSInteger)start end:(NSInteger)end {
    if (start > end) return nil;
    timeComplexity++;
    NSInteger mid = (start + end) / 2;
    NodeBST *node = [[NodeBST alloc] initWithObject:array[mid]];
    node.left = [self sortedArrayToBST:array start:start end:(mid - 1)];
    node.right = [self sortedArrayToBST:array start:(mid + 1) end:end];
    return node;
}

@end
