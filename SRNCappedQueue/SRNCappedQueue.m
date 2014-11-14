//
// Created by Sorin Neacsu on 10/14/14.
// Copyright (c) 2014 Sorin Neacsu. All rights reserved.
//

#import "SRNCappedQueue.h"


@implementation SRNCappedQueue {
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

- (NSArray *)dequeueAll {
    return [self dequeueWithCount:[self count]];
}

- (NSArray *)dequeueWithCount:(NSInteger)count {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (int i = 0; i < count; ++i) {
        id obj = [self dequeue];
        if(obj) {
            [result addObject:obj];
        }
    }
    return result;
}

- (NSUInteger)count {
    return [queue count];
}

- (NSArray *)queueCopy {
    return [NSArray arrayWithArray:queue];
}

- (NSArray *)newestObjects:(NSInteger)count {
    NSUInteger totalCount = [self count];
    NSUInteger start = (unsigned int)fmax(0, totalCount-count);
    return [queue subarrayWithRange:(NSRange){start, totalCount}];
}


@end
