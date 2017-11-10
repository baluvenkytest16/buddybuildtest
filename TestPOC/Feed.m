//
//  Feed.m
//  TestPOC
//
//  Created by Venkat on 21/10/17.
//  Copyright © 2017 TestPOC. All rights reserved.
//

#import "Feed.h"

@implementation Feed

- (instancetype)initWithDictionary:(NSDictionary *)feedInfo
{
    self = [super init];
    if (self) {
        self.id     = feedInfo[@"id"];
        self.likes  = feedInfo[@"likes"];
    }
    return self;
}

@end
