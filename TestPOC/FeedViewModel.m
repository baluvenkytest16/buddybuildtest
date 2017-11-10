//
//  FeedViewModel.m
//  TestPOC
//
//  Created by Venkat on 21/10/17.
//  Copyright © 2017 TestPOC. All rights reserved.
//

#import "FeedViewModel.h"
#import "Feed.h"
@implementation FeedViewModel

- (instancetype)initWithFeed:(Feed *)feed
{
    self = [super init];
    if (self) {
        self.feed = feed;
    }
    return self;
}
- (NSString *)getFeedDisplayText {
    
    __block NSString *displayText;
    NSInteger count = _feed.likes.count;
    
    if(count == 0)
        return @"No onelikes this";
    else if(count == 1)
        displayText =  [NSString stringWithFormat:@"%@ likes this", self.feed.likes[0]];
    else if(count == 2)
        displayText = [NSString stringWithFormat:@"%@ and %@ liked this", self.feed.likes[0], self.feed.likes[1]];
    else if(count == 3)
        displayText = [NSString stringWithFormat:@"%@, %@ and %@ like this", self.feed.likes[0], self.feed.likes[1], self.feed.likes[2]];
    else
        displayText = [NSString stringWithFormat:@"%@, %@ and %ld other likes this", self.feed.likes[0], self.feed.likes[1], self.feed.likes.count];
    return displayText;
}
@end
