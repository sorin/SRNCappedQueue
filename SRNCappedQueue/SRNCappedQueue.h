//
// Created by Sorin Neacsu on 10/14/14.
// Copyright (c) 2014 Sorin Neacsu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SRNCappedQueue : NSObject

- (instancetype)initWithSize:(NSInteger)aSize;

- (id)dequeue;

- (NSArray *)dequeueAll;

- (NSArray *)dequeueWithCount:(NSInteger)count;

- (void)enqueue:(id)obj;

- (NSUInteger)count;

- (NSArray *)queueCopy;

- (NSArray *)newestObjects:(NSInteger)count;

@end
