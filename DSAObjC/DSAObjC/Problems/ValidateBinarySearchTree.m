//
//  ValidateBinarySearchTree.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/22/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/*
 
 Given a binary tree, determine if it is a valid binary search tree.
 
 */

#import "ValidateBinarySearchTree.h"
#import "NodeBST.h"
#import "BinarySearchTree.h"

@interface ValidateBinarySearchTree ()

@property (nonatomic, copy) NSComparator nsComparator;

@end

@implementation ValidateBinarySearchTree

- (void)runTheProblem {
    NSComparator nsc = ^NSComparisonResult(id obj1, id obj2) {
        NSString *string1 = (NSString *)obj1;
        NSString *string2 = (NSString *)obj2;
        return [string1 compare:string2 options:NSLiteralSearch|NSNumericSearch|NSCaseInsensitiveSearch];
    };

    // If you stick nsc2 into the init for bst, then isValidBst will return 'NO'
//    NSComparator nsc2 = ^NSComparisonResult(id obj1, id obj2) {
//        NSString *string1 = (NSString *)obj1;
//        NSString *string2 = (NSString *)obj2;
//        return [string2 compare:string1 options:NSLiteralSearch|NSNumericSearch|NSCaseInsensitiveSearch];
//    };
    
    self.nsComparator = nsc;
    
    BinarySearchTree *bst = [[BinarySearchTree alloc] initWithRoot:nil nsComparator:nsc];
    
    [bst insertObject:@"def"];
    [bst insertObject:@"abc"];
    [bst insertObject:@"ghi"];
    [bst insertObject:@"jkl"];
    [bst insertObject:@"mno"];
    [bst insertObject:@"stu"];
    [bst insertObject:@"pqr"];
    [bst insertObject:@"vwx"];
    
    NSString *r = [self isValidBst:bst.root] ? @"YES" : @"NO";
    NSLog(@"%@: BST:%@ TC:%f", self.class, r, timeComplexity);
}

- (BOOL)isValidBst:(NodeBST *)node {
//    if (!node.left && !node.right) {
//        return YES;
//    }
    
    timeComplexity++;
    NSLog(@"CH: %@ L:%@ R:%@", node.object, node.left.object, node.right.object);
    
    if (node.left && (NSOrderedDescending == self.nsComparator(node.left.object, node.object)
                        || ![self isValidBst:node.left])) {
        return NO;
    }
    
    if (node.right && (NSOrderedAscending == self.nsComparator(node.right.object, node.object)
                        || ![self isValidBst:node.right])) {
        return NO;
    }
    
    return YES;
}

@end
