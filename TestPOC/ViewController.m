//
//  ViewController.m
//  TestPOC
//
//  Created by Venkat on 21/10/17.
//  Copyright © 2017 TestPOC. All rights reserved.
//

#import "ViewController.h"
#import "FeedViewModel.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>
{
    NSArray *feedList;
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    CLPlacemark *placemark;
    CLGeocoder *geocoder;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    geocoder = [[CLGeocoder alloc] init];
    locationManager = [[CLLocationManager alloc] init];
    [locationManager requestWhenInUseAuthorization];
    locationManager.delegate        = self;
    locationManager.distanceFilter  = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_NA, __IPHONE_2_0, __IPHONE_6_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED{
    
    currentLocation = newLocation;
    if(oldLocation){
        NSLog(@"Old Location:: %f, %f", oldLocation.coordinate.longitude, oldLocation.coordinate.latitude);
    }
    if(newLocation){
        NSLog(@"New Location:: %f, %f", newLocation.coordinate.longitude, newLocation.coordinate.latitude);
    }
    
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            NSString *loccationText = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                       placemark.subThoroughfare, placemark.thoroughfare,
                                       placemark.postalCode, placemark.locality,
                                       placemark.administrativeArea,
                                       placemark.country];
            NSLog(@"Location Text:: %@", loccationText);
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    }];

    
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations __OSX_AVAILABLE_STARTING(__MAC_10_9,__IPHONE_6_0){
    [locations enumerateObjectsUsingBlock:^(CLLocation * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CLLocation *location = (CLLocation *)obj;
        NSLog(@"Location:: %f, %f", location.coordinate.longitude, location.coordinate.latitude);
        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
            if (error == nil && [placemarks count] > 0) {
                placemark = [placemarks lastObject];
                NSString *loccationText = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                           placemark.subThoroughfare, placemark.thoroughfare,
                                           placemark.postalCode, placemark.locality,
                                           placemark.administrativeArea,
                                           placemark.country];
                NSLog(@"Location Text:: %@", loccationText);
            } else {
                NSLog(@"%@", error.debugDescription);
            }
        }];
    }];
   // [locationManager stopUpdatingLocation];
    
    
}
- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"%@", [error description]);
}

@end
