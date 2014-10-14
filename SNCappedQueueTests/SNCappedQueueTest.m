//
//  SNCappedQueueTest.m
//  SNCappedQueue
//
//  Created by Sorin on 10/14/14.
//  Copyright (c) 2014 Sorin Neacsu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SNCappedQueue.h"


@interface SNCappedQueueTest : XCTestCase

@end


@implementation SNCappedQueueTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSizeNegative {
    XCTAssertThrows([[SNCappedQueue alloc] initWithSize:-1]);
}

- (void)testSizeZero {
    XCTAssertThrows([[SNCappedQueue alloc] initWithSize:0]);
}

- (void)testCountSizeOneEnqueueOne {
    SNCappedQueue *q = [[SNCappedQueue alloc] initWithSize:1];
    [q enqueue:@(1)];
    XCTAssertEqual(1, [q count]);
}

- (void)testCountSizeOneEnqueueTwo {
    SNCappedQueue *q = [[SNCappedQueue alloc] initWithSize:1];
    [q enqueue:@(1)];
    [q enqueue:@(2)];
    XCTAssertEqual(1, [q count]);
}

- (void)testCountSizeTwoEnqueueTwo {
    SNCappedQueue *q = [[SNCappedQueue alloc] initWithSize:2];
    [q enqueue:@(1)];
    [q enqueue:@(2)];
    XCTAssertEqual(2, [q count]);
}

- (void)testSizeOneEnqueueOneDequeueOne {
    SNCappedQueue *q = [[SNCappedQueue alloc] initWithSize:1];
    NSNumber *enqueued = [NSNumber numberWithInt:1];
    [q enqueue:enqueued];
    NSNumber *dequeued = [q dequeue];
    XCTAssertEqual(enqueued, dequeued);
}

- (void)testSizeOneEnqueueTwoDequeueOne {
    SNCappedQueue *q = [[SNCappedQueue alloc] initWithSize:1];
    NSNumber *enqueuedFirst = [NSNumber numberWithInt:1];
    [q enqueue:enqueuedFirst];
    NSNumber *enqueuedSecond = [NSNumber numberWithInt:2];
    [q enqueue:enqueuedSecond];
    NSNumber *dequeued = [q dequeue];
    XCTAssertEqual(enqueuedSecond, dequeued);
}

- (void)testSizeOneEnqueueTwoDequeueTwo {
    SNCappedQueue *q = [[SNCappedQueue alloc] initWithSize:1];
    NSNumber *enqueuedFirst = [NSNumber numberWithInt:1];
    [q enqueue:enqueuedFirst];
    NSNumber *enqueuedSecond = [NSNumber numberWithInt:2];
    [q enqueue:enqueuedSecond];
    NSNumber *dequeuedFirst = [q dequeue];
    NSNumber *dequeuedSecond = [q dequeue];
    XCTAssertNil(dequeuedSecond);
}

@end
