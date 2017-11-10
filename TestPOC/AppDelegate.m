//
//  AppDelegate.m
//  TestPOC
//
//  Created by Venkat on 21/10/17.
//  Copyright © 2017 TestPOC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //Taking input text
    NSArray *dataInfo = @[@{@"id":@(1), @"likes":@[]},
                          @{@"id":@(2), @"likes": @[@"Peter"]},
                          @{@"id":@(3), @"likes": @[@"John", @"Mark"]},
                          @{@"id":@(4), @"likes": @[@"Paul", @"Lilly", @"Alex"]},
                          @{@"id":@(5), @"likes": @[@"Sarah", @"Michelle", @"Alex", @"Jhon"]}];
    
    NSArray *outPutList = [self getParsedResponse:dataInfo];
    //NSLog(@"%@", outPutList);
    return YES;
}
- (NSArray *)getParsedResponse:(NSArray *)infoList {
    
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:3];
    [infoList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableDictionary *tempFeedObj = [(NSDictionary *) obj mutableCopy];
        tempFeedObj[@"text"] = [self getLikedDisplayText:tempFeedObj[@"likes"]];
        [tempFeedObj removeObjectForKey:@"likes"];
        [list addObject:tempFeedObj];
    }];
    return [list copy]; // making Immutable object again
}
- (NSString *)getLikedDisplayText:(NSArray *)_peopleLiked {
    __block NSString *displayText;
    NSInteger count = _peopleLiked.count;
    
    //NSString *tempText = [[[NSArray arrayWithArray:_peopleLiked] valueForKey:@"description"] componentsJoinedByString:@""];
    if(count == 0)
        return @"No onelikes this";
    else if(count == 1)
        displayText =  [NSString stringWithFormat:@"%@ likes this", _peopleLiked[0]];
    else if(count == 2)
        displayText = [NSString stringWithFormat:@"%@ and %@ like this", _peopleLiked[0], _peopleLiked[1]];
    else if(count == 3)
        displayText = [NSString stringWithFormat:@"%@, %@ and %@ like this", _peopleLiked[0], _peopleLiked[1], _peopleLiked[2]];
    else
        displayText = [NSString stringWithFormat:@"%@, %@ and %ld other likes this", _peopleLiked[0], _peopleLiked[1], _peopleLiked.count];
    return displayText;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
