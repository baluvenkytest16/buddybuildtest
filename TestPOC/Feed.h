//
//  Feed.h
//  TestPOC
//
//  Created by Venkat on 21/10/17.
//  Copyright © 2017 TestPOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject

@property(strong,nonatomic) NSString *id;
@property(strong,nonatomic) NSString *text;
@property(strong,nonatomic) NSArray *likes;

- (instancetype)initWithDictionary:(NSDictionary *)feedInfo;
@end
