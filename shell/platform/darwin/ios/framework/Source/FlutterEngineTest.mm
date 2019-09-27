// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import <OCMock/OCMock.h>
#import <XCTest/XCTest.h>
#import "flutter/shell/platform/darwin/ios/framework/Headers/FlutterEngine.h"

#ifndef __has_feature
#define __has_feature(x) 0 /* for non-clang compilers */
#endif

#if !__has_feature(objc_arc)
#error ARC must be enabled!
#endif

@interface FlutteEngineTest : XCTestCase
@end

@implementation FlutteEngineTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testCreate {
  id project = OCMClassMock([FlutterDartProject class]);
  FlutterEngine* engine = [[FlutterEngine alloc] initWithName:@"foobar" project:project];
  XCTAssertNotNil(engine);
}

- (void)testSendMessageBeforeRun {
  id project = OCMClassMock([FlutterDartProject class]);
  FlutterEngine* engine = [[FlutterEngine alloc] initWithName:@"foobar" project:project];
  XCTAssertNotNil(engine);
  XCTAssertThrows([engine.binaryMessenger
      sendOnChannel:@"foo"
            message:[@"bar" dataUsingEncoding:NSUTF8StringEncoding]
        binaryReply:nil]);
}

- (void)testSetMessageHandlerBeforeRun {
  id project = OCMClassMock([FlutterDartProject class]);
  FlutterEngine* engine = [[FlutterEngine alloc] initWithName:@"foobar" project:project];
  XCTAssertNotNil(engine);
  XCTAssertThrows([engine.binaryMessenger
      setMessageHandlerOnChannel:@"foo"
            binaryMessageHandler:^(NSData* _Nullable message, FlutterBinaryReply _Nonnull reply){

            }]);
}

@end
