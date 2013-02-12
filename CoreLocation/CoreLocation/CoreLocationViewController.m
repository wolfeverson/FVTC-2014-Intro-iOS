//
//  CoreLocationViewController.m
//  CoreLocation
//
//  Created by student on 2/11/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "CoreLocationViewController.h"



@implementation CoreLocationViewController


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [locationManager startUpdatingLocation];
    }
    return self;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Could not find Location: %@", error);
    

}

-(void) dealloc
{
    [locationManager setDelegate:nil];
}

//-(void)finishedFindingLocation:(CLLocation *)newLocation
//{
    //SEL updateMethod = @selector(locationmanager:didUpdateToLocation:from:Location:);
    
   // if ([[self delegate] respondsToSelector:updateMethod])
    //{
    //    [[self delegate] locationManager:self didUpdateToLocation:NewLocation fromLocation:oldLocation];
  //  }
//}

@end




