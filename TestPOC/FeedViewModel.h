//
//  FeedViewModel.h
//  TestPOC
//
//  Created by Venkat on 21/10/17.
//  Copyright © 2017 TestPOC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feed.h"

@interface FeedViewModel : NSObject

@property (strong , nonatomic) Feed *feed;

- (instancetype)initWithFeed:(Feed *)feed;
- (NSString *)getFeedDisplayText;
@end
