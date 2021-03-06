/*
  CensusResults.m
  CensusPuzzle

  Solution to Code challenge for an iOS developer position at Open Garden, in Oakland. Ca.

  The 2010 Census puts populations of 26 largest US metro areas at 18897109, 12828837, 9461105, 6371773, 5965343, 5946800, 5582170, 5564635, 5268860, 4552402, 4335391, 4296250, 4224851, 4192887, 3439809, 3279833, 3095313, 2812896, 2783243, 2710489, 2543482, 2356285, 2226009, 2149127, 2142508, and 2134411 (100,000,000).

  Created by Matthew Lintlop on 12/1/17.
  Copyright © 2017 Matthew Lintlop. All rights reserved.
*/

#import "CensusResults.h"

@implementation CensusResults

- (instancetype)init {
    if (self = [super init]) {
        self.populations = @[@18897109, @12828837, @9461105, @6371773, @5965343, @5946800, @5582170, @5564635, @5268860, @4552402, @4335391, @4296250, @4224851, @4192887, @3439809, @3279833, @3095313, @2812896, @2783243, @2710489, @2543482, @2356285, @2226009, @2149127, @2142508, @2134411];
        self.done = false;
        self.resultPopulations = nil;
    }
    
    return self;
}

- (void) subset_sum:(NSArray<NSNumber*>*)numbers target:(int)target {
    [self subset_sumRecursive:numbers target:target partial:[NSMutableArray array]];
}

- (void) subset_sumRecursive:(NSArray<NSNumber*>*)numbers target:(int)target partial:(NSMutableArray<NSNumber*>*)partial {
    if (self.done) return;
    
    // compute the current partial sum.
    int sum = 0;
    for (NSNumber *number in partial) {
        sum += number.intValue;
    }
    
    // if the current partial sum equals the targe value, show the result populations.
    if (sum == target) {
        self.done = true;
        self.resultPopulations = partial;
    }
    // exit if done.
    if (sum >= target) return;
    
    // recursively comptute the partial sums of remaining elements
    for (int index = 0; index < numbers.count; index++) {
        NSMutableArray<NSNumber*>* remaining = [NSMutableArray array];
        for (int index2 = index+1; index2 < numbers.count; index2++) {
            [remaining addObject:numbers[index2]];
        }
        
        NSMutableArray<NSNumber*>* partial_rec = [partial mutableCopy];
        [partial_rec addObject:numbers[index]];
        [self subset_sumRecursive:remaining target:target partial:partial_rec];
    }
}

- (NSArray<NSNumber*>*)findPopulationsWithSum:(int)sum {
    NSTimeInterval start = [[[NSDate alloc] init] timeIntervalSinceReferenceDate];
    [self subset_sum:self.populations target:sum];
    NSTimeInterval end = [[[NSDate alloc] init] timeIntervalSinceReferenceDate];
    NSTimeInterval elapsed = end - start;
    NSLog(@"Elapsed Time = %.6f Seconds", elapsed);
    return self.resultPopulations;
}

@end
