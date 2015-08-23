//
//  NodeLL.h
//  DataStructuresAlgorithmsObjC
//
//  Created by WAYNE SMALL on 8/19/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NodeLL : NSObject

@property (nonatomic, strong) id object;
@property (nonatomic, strong) NodeLL *next;
@property (nonatomic, strong) NodeLL *prev;

- (id)initWithObject:(id)object NS_DESIGNATED_INITIALIZER;

@end
