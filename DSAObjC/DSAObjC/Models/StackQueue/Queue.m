//
//  Queue.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/22/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "Queue.h"

@interface Queue ()

@property (nonatomic, strong) NSMutableArray *objects;

@end

@implementation Queue

- (id)init {
    if (self = [super init]) {
        _objects = [NSMutableArray array];
    }
    return self;
}

- (BOOL)isEmpty {
    return self.objects.count == 0;
}

- (id)dequeue {
    // Set aside a reference to the object to pass back
    id queueObject = nil;
    
    // Do we have any items?
    if ([self.objects lastObject]) {
        // Pick out the first one
        queueObject = [self.objects objectAtIndex: 0];
        // Remove it from the queue
        [self.objects removeObjectAtIndex: 0];
    }
    
    // Pass back the dequeued object, if any
    return queueObject;
}

// Add to the tail of the queue
-(void) enqueue: (id) anObject {
    // Push the item in
    [self.objects addObject: anObject];
}

@end
