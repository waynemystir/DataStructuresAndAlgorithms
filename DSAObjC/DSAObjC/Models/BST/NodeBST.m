//
//  NodeBST.m
//  DataStructuresAlgorithmsObjC
//
//  Created by WAYNE SMALL on 8/15/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "NodeBST.h"

@implementation NodeBST

- (id)initWithObject:(id)data {
    if (self = [super init]) {
        _object = data;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"      %@      \n   /      \\", self.object];
}

- (UIView *)view {
    CGFloat xs = !self.parentsLeftOrRight ? -40.0f : 40.f;
    CGFloat x = self.parent ? self.parent.view.frame.origin.x + xs : 60;
    CGFloat y = self.parent ? self.parent.view.frame.origin.y + 70 : 0;
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(x, y, 70, 60)];
    
    UILabel *l = [[UILabel alloc] initWithFrame:v.bounds];
    l.numberOfLines = 2;
    l.text = self.description;
    l.backgroundColor = [UIColor redColor];
    [v addSubview:l];
    
    return v;
}

@end
