//
// Created by Sorin Neacsu on 10/14/14.
// Copyright (c) 2014 Sorin Neacsu. All rights reserved.
//

#import "SNCappedQueue.h"


@implementation SNCappedQueue {
    NSMutableArray *queue;
    NSInteger size;
}

- (instancetype)initWithSize:(NSInteger)aSize {
    NSParameterAssert( aSize > 0 );
    self = [super init];
    if (self) {
        queue = [[NSMutableArray alloc] init];
        size = aSize;
    }
    return self;
}

- (id)init {
    return nil;
}

- (void)enqueue:(id)object {
    [queue addObject:object];
    if ([queue count] > size) {
        [queue removeObjectAtIndex:0];
    };
}

- (id)dequeue {
    id returnObject = [queue lastObject];
    if (returnObject) {
        [queue removeLastObject];
    }
    return returnObject;
}

- (NSInteger)count {
    return [queue count];
}

@end
