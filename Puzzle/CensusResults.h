//
//  CensusResults.h
//  Puzzle
//
//  Created by Matthew Lintlop on 12/1/17.
//  Copyright © 2017 Matthew Lintlop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CensusResults : NSObject

- (instancetype)init;

- (void)doTest;

- (void) subset_sum:(NSArray *)numbers target:(int)target;
- (void) subset_sumRecursive:(NSArray *)numbers target:(int)target partial:(NSArray *)partial;

@property (nonatomic, strong) NSArray<NSNumber*> *populations;

@end
