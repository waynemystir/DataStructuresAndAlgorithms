//
//  WisDigit.m
//  DSAObjC
//
//  Created by WAYNE SMALL on 8/25/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "WisDigit.h"

@implementation WisDigit

- (void)runThis {
    unichar charA = 'a';
    unichar char5 = '5';
    int num = 121;
    
    if (!isdigit(charA)) {
        NSLog(@"'%hu' is NOT a digit", charA);
    }
    
    if (isdigit(char5)) {
        NSLog(@"'%hu' aka '%d' is a digit'", char5, char5 - '0');
    }
    
    int wum = num + char5;
    int sum = num + char5 - '0';
    NSLog(@"'%d' + '%d' = '%d' but not '%d'", num, char5 - '0', sum, wum);
}

@end
