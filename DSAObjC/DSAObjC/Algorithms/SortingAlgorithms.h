//
//  SortingAlgorithms.h
//  SortingObjectiveC
//
//  Created by WAYNE SMALL on 8/13/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SortingAlgorithms : NSObject

+ (void)mergeSort:(NSMutableArray *)arr;
+ (void)insertionSort:(NSMutableArray *)arr;
+ (void)selectionSort:(NSMutableArray *)arr;
+ (void)bubbleSort:(NSMutableArray *)arr;

@end
