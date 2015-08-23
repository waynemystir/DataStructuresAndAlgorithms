//
//  BinarySearchTree.h
//  DataStructuresAlgorithmsObjC
//
//  Created by WAYNE SMALL on 8/15/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NodeBST.h"

@interface BinarySearchTree : NSObject

@property (nonatomic, strong) NodeBST *root;
@property (nonatomic, copy) NSComparator nsComparator;
@property (nonatomic, strong) UIView *treeView;

- (id)initWithRoot:(NodeBST *)root nsComparator:(NSComparator)nsComparator NS_DESIGNATED_INITIALIZER;

/**
 * search
 */
- (NodeBST *)searchTree:(id)object;

/**
 * traversals
 */
- (void)traverseTreeInOrder;

/**
 * visit the node
 */
- (void)processNode:(NodeBST *)node;

/**
 * insert
 */
- (void)insertObject:(id)object;

/**
 * delete
 */
- (NodeBST *)deleteObject:(id)object;

@end
