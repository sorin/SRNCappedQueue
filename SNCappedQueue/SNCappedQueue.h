//
// Created by Sorin Neacsu on 10/14/14.
// Copyright (c) 2014 Sorin Neacsu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SNCappedQueue : NSObject

- (instancetype)initWithSize:(NSInteger)aSize;

- (id)dequeue;

- (void)enqueue:(id)obj;

- (NSInteger)count;

@end
