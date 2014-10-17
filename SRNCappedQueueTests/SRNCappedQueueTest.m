//
//  SRNCappedQueueTest.m
//  SRNCappedQueue
//
//  Created by Sorin on 10/14/14.
//  Copyright (c) 2014 Sorin Neacsu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SRNCappedQueue.h"


@interface SRNCappedQueueTest : XCTestCase

@end


@implementation SRNCappedQueueTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSizeNegative {
    XCTAssertThrows([[SRNCappedQueue alloc] initWithSize:-1]);
}

- (void)testSizeZero {
    XCTAssertThrows([[SRNCappedQueue alloc] initWithSize:0]);
}

- (void)testCountSizeOneEnqueueOne {
    SRNCappedQueue *q = [[SRNCappedQueue alloc] initWithSize:1];
    [q enqueue:@(1)];
    XCTAssertEqual(1, [q count]);
}

- (void)testCountSizeOneEnqueueTwo {
    SRNCappedQueue *q = [[SRNCappedQueue alloc] initWithSize:1];
    [q enqueue:@(1)];
    [q enqueue:@(2)];
    XCTAssertEqual(1, [q count]);
}

- (void)testCountSizeTwoEnqueueTwo {
    SRNCappedQueue *q = [[SRNCappedQueue alloc] initWithSize:2];
    [q enqueue:@(1)];
    [q enqueue:@(2)];
    XCTAssertEqual(2, [q count]);
}

- (void)testSizeOneEnqueueOneDequeueOne {
    SRNCappedQueue *q = [[SRNCappedQueue alloc] initWithSize:1];
    NSNumber *enqueued = [NSNumber numberWithInt:1];
    [q enqueue:enqueued];
    NSNumber *dequeued = [q dequeue];
    XCTAssertEqual(enqueued, dequeued);
}

- (void)testSizeOneEnqueueTwoDequeueOne {
    SRNCappedQueue *q = [[SRNCappedQueue alloc] initWithSize:1];
    NSNumber *enqueuedFirst = [NSNumber numberWithInt:1];
    [q enqueue:enqueuedFirst];
    NSNumber *enqueuedSecond = [NSNumber numberWithInt:2];
    [q enqueue:enqueuedSecond];
    NSNumber *dequeued = [q dequeue];
    XCTAssertEqual(enqueuedSecond, dequeued);
}

- (void)testSizeOneEnqueueTwoDequeueTwo {
    SRNCappedQueue *q = [[SRNCappedQueue alloc] initWithSize:1];
    NSNumber *enqueuedFirst = [NSNumber numberWithInt:1];
    [q enqueue:enqueuedFirst];
    NSNumber *enqueuedSecond = [NSNumber numberWithInt:2];
    [q enqueue:enqueuedSecond];
    NSNumber *dequeuedFirst = [q dequeue];
    NSNumber *dequeuedSecond = [q dequeue];
    XCTAssertNil(dequeuedSecond);
}

- (void)testSizeThreeEnqueueTwoDequeueWithCountTwo {
    SRNCappedQueue *q = [[SRNCappedQueue alloc] initWithSize:3];
    NSNumber *enqueuedFirst = [NSNumber numberWithInt:1];
    [q enqueue:enqueuedFirst];
    NSNumber *enqueuedSecond = [NSNumber numberWithInt:2];
    [q enqueue:enqueuedSecond];
    NSNumber *enqueuedThird = [NSNumber numberWithInt:3];
    [q enqueue:enqueuedThird];
    NSArray *dequeued = [q dequeueWithCount:2];
    XCTAssertEqual(2, [dequeued count]);
    XCTAssertEqual(enqueuedThird, dequeued[0]);
    XCTAssertEqual(enqueuedSecond, dequeued[1]);
    XCTAssertEqual(1, [q count]);
}

- (void)testSizeOneEnqueueOneDequeueWithCountTwo {
    SRNCappedQueue *q = [[SRNCappedQueue alloc] initWithSize:1];
    NSNumber *enqueuedFirst = [NSNumber numberWithInt:1];
    [q enqueue:enqueuedFirst];
    NSArray *dequeued = [q dequeueWithCount:2];
    XCTAssertEqual(1, [dequeued count]);
    XCTAssertEqual(enqueuedFirst, dequeued[0]);
    XCTAssertEqual(0, [q count]);
}

@end
