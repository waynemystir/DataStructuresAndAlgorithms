//
//  IsHeightBalancedTree.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/22/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/*


 
 */

#import "IsHeightBalancedTree.h"
#import "NodeBST.h"
#import "BinarySearchTree.h"

@implementation IsHeightBalancedTree

- (void)runTheProblem {
    NSComparator nsc = ^NSComparisonResult(id obj1, id obj2) {
        NSString *string1 = (NSString *)obj1;
        NSString *string2 = (NSString *)obj2;
        return [string1 compare:string2 options:NSLiteralSearch|NSNumericSearch|NSCaseInsensitiveSearch];
    };
    
    BinarySearchTree *bst = [[BinarySearchTree alloc] initWithRoot:nil nsComparator:nsc];

    // not balanced
//    [bst insertObject:@"def"];
//    [bst insertObject:@"abc"];
//    [bst insertObject:@"ghi"];
//    [bst insertObject:@"jkl"];
//    [bst insertObject:@"mno"];
//    [bst insertObject:@"stu"];
//    [bst insertObject:@"pqr"];
//    [bst insertObject:@"vwx"];
    
    // balanced
    [bst insertObject:@"jkl"];
    [bst insertObject:@"def"];
    [bst insertObject:@"abc"];
    [bst insertObject:@"ghi"];
    [bst insertObject:@"stu"];
    [bst insertObject:@"mno"];
    [bst insertObject:@"pqr"];
    [bst insertObject:@"vwx"];
    
    NSString *ib = [self isBalanced:bst.root] ? @"YES" : @"NO";
    NSLog(@"%@: isBalanced:%@ TC:%f", self.class, ib, timeComplexity);
}

- (BOOL)isBalanced:(NodeBST *)root {
    return [self maxDepth:root] != -1;
}

- (NSInteger)maxDepth:(NodeBST *)root {
    if (!root) return 0;
    timeComplexity++;
    NSInteger L = [self maxDepth:root.left];
    if (L == -1) return -1;
    NSInteger R = [self maxDepth:root.right];
    if (R == -1) return -1;
    return (labs(L - R) <= 1) ? (MAX(L, R) + 1) : -1;
}

@end
