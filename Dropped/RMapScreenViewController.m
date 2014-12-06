//
//  RMapScreenViewController.m
//  Dropped
//
//  Created by Ravinder Vatish on 12/3/14.
//  Copyright (c) 2014 Ravinder Vatish. All rights reserved.
//

#import "RMapScreenViewController.h"

@interface RMapScreenViewController ()

@end

@implementation RMapScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //set the delegates for mapview and corelocation
    _l_mapView.delegate = self;
    _locationManager.delegate = self;
    
    //current location display setup
    _locationManager = [[CLLocationManager alloc]init];
    [_locationManager requestWhenInUseAuthorization];
    CLAuthorizationStatus authorizationStatus= [CLLocationManager authorizationStatus];
    if (authorizationStatus == kCLAuthorizationStatusAuthorized ||
        authorizationStatus == kCLAuthorizationStatusAuthorizedAlways ||
        authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [_locationManager startUpdatingLocation];
        _l_mapView.showsUserLocation = YES;
        
    }
    else
    {
        NSLog(@"Device is not allowed to use the location service");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)locationManager:(CLLocationManager *)manager
    didUpdateLocations:(NSArray *)locations
{
    NSLog(@"didUpdateLocations called, Location %@",locations);
 //   MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(locations.coordinate, 800, 800);
   // [_l_mapView setRegion:[_l_mapView regionThatFits:region] animated:YES];
}

- (void)mapView:(MKMapView *)mapView
regionWillChangeAnimated:(BOOL)animated
{
    NSLog(@"regionWillChangeAnimated called");
   // MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(_locationManager.location, 800, 800);
    
}

@end
