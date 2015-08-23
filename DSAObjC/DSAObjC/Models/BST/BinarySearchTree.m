//
//  BinarySearchTree.m
//  DataStructuresAlgorithmsObjC
//
//  Created by WAYNE SMALL on 8/15/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "BinarySearchTree.h"

@implementation BinarySearchTree

- (id)initWithRoot:(NodeBST *)root nsComparator:(NSComparator)nsComparator {
    if (self = [super init]) {
        _root = root;
        _nsComparator = nsComparator;
        _treeView = [UIView new];
        _treeView.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (NodeBST *)searchTree:(id)object {
    return [self searchTree:self.root object:object];
}

- (NodeBST *)searchTree:(NodeBST *)node object:(id)object {
    if (!node || !object) {
        return nil;
    }
    
    switch (self.nsComparator(node.object, object)) {
        case NSOrderedSame:
            return node;
        case NSOrderedDescending:
            return [self searchTree:node.left object:object];
        case NSOrderedAscending:
            return [self searchTree:node.right object:object];
            
        default:
            break;
    }
}

- (void)traverseTreeInOrder {
    return [self traverseTreeInOrder:self.root];
}

- (void)traverseTreeInOrder:(NodeBST *)node {
    if (!node) {
        return;
    }
    
    [self traverseTreeInOrder:node.left];
    [self processNode:node];
    [self traverseTreeInOrder:node.right];
}

- (void)processNode:(NodeBST *)node {
    NSLog(@"NODE:%@", node.object);
    [self.treeView addSubview:node.view];
    [self.treeView sizeToFit];
}

- (void)insertObject:(id)object {
    if (!object) {
        // Nothing to see here, we're not going to insert nothing
    } else if (!self.root) {
        self.root = [[NodeBST alloc] initWithObject:object];
    } else {
        [self insertNode:[[NodeBST alloc] initWithObject:object] parent:self.root];
    }
}

- (void)insertNode:(NodeBST *)newNode parent:(NodeBST *)parent {
    switch (self.nsComparator(newNode.object, parent.object)) {
        case NSOrderedAscending: {
            if(!parent.left) {
                parent.left = newNode;
                newNode.parent = parent;
                newNode.parentsLeftOrRight = NO;
            } else {
                [self insertNode:newNode parent:parent.left];
            }
            break;
        }
            
        case NSOrderedDescending: {
            if (!parent.right) {
                parent.right = newNode;
                newNode.parent = parent;
                newNode.parentsLeftOrRight  = YES;
            } else {
                [self insertNode:newNode parent:parent.right];
            }
        }
            
        case NSOrderedSame: {
            // Nothing to see here, i.e. we won't add duplicate values
            break;
        }
    
        default:
            break;
    }
}

- (NodeBST *)deleteObject:(id)object {
    NodeBST *nodeToDelete = [self searchTree:object];
    
    if (!nodeToDelete) {
        return nil;
    }
    
    if (nodeToDelete.left && nodeToDelete.right) {
        ;
    } else {
        
    }
    
    return nodeToDelete;
}

@end
