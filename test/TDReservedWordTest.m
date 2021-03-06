//  Copyright 2010 Todd Ditchendorf
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import "TDReservedWordTest.h"
#import "ParseKit.h"

@implementation TDReservedWordTest

- (void)testFoobar {
    NSString *s = @"Foobar";
    [TDReservedWord setReservedWords:[NSArray arrayWithObject:@"Foobar"]];
    
    PKAssembly *a = [PKTokenAssembly assemblyWithString:s];
    
    PKParser *p = [TDReservedWord word];
    PKAssembly *result = [p completeMatchFor:a];
    
    TDNotNil(result);
    TDEqualObjects(@"[Foobar]Foobar^", [result description]);
//    TDNil(result);
}


- (void)testfoobar {
    NSString *s = @"foobar";
    [TDReservedWord setReservedWords:[NSArray arrayWithObject:@"Foobar"]];
    
    PKAssembly *a = [PKTokenAssembly assemblyWithString:s];
    
    PKParser *p = [TDReservedWord word];
    PKAssembly *result = [p completeMatchFor:a];
    
    TDNil(result);
}

@end
