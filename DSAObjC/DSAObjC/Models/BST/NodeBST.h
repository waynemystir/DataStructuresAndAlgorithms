//
//  NodeBST.h
//  DataStructuresAlgorithmsObjC
//
//  Created by WAYNE SMALL on 8/15/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NodeBST : NSObject

@property (nonatomic, strong) id object;
@property (nonatomic, strong) NodeBST *parent;
@property (nonatomic) BOOL parentsLeftOrRight;
@property (nonatomic, strong) NodeBST *left;
@property (nonatomic, strong) NodeBST *right;
@property (nonatomic, weak) UIView *view;

- (id)initWithObject:(id)data;

@end
