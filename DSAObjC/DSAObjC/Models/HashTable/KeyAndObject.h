//
//  KeyAndObject.h
//  LeetCode
//
//  Created by WAYNE SMALL on 8/21/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyAndObject : NSObject

@property (nonatomic, strong) id key;
@property (nonatomic, strong) id object;

- (id)initWithKey:(id)key object:(id)object NS_DESIGNATED_INITIALIZER;

@end
