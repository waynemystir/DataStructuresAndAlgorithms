//
//  LinkedList.h
//  DataStructuresAlgorithmsObjC
//
//  Created by WAYNE SMALL on 8/19/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NodeLL.h"

@interface LinkedList : NSObject

@property (nonatomic, strong) NodeLL *head;
@property (nonatomic) BOOL isEmpty;
@property (nonatomic, copy) NSComparator nsComparator;

- (id)initWithHead:(id)object nsComparator:(NSComparator)nsComparator NS_DESIGNATED_INITIALIZER;
- (void)addObject:(id)object;
- (void)appendObject:(id)object;
- (void)traverse;
- (NodeLL *)find:(id)object;
- (NodeLL *)removeObject:(id)object;

@end
