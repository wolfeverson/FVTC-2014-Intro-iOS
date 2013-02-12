//
//  CoreLocationViewController.h
//  CoreLocation
//
//  Created by student on 2/11/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CoreLocationViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}
@end







@protocol CLLocationManagerDelegate <NSObject>

@optional

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;
-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading;
-(BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager;
-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region;
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;
@end
