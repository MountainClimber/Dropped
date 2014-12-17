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
    
    //TODO: need to move in constructrue
      _locationArray = [[NSMutableArray alloc]init];
        firstLocationUpdateReported = true;
    
    
    // Do any additional setup after loading the view.
    
    //set the delegates for mapview and corelocation
    _mapView.delegate = self;
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
        _mapView.showsUserLocation = YES;
       
         MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(_locationManager.location.coordinate, 10, 10);
        [_mapView setRegion:region];
    }
    else
    {
        NSLog(@"Device is not allowed to use the location service");
    }
    
}

- (id)init {
    self = [super init];
    if (self)
    {
      //  _lastRecordedLocation =

    }
    return self;
    
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
//    if(firstLocationUpdateReported == true)
//    {
//        
//        firstLocationUpdateReported = false;
//        [_locationArray addObject:locations];
//    }
//    
//    //update last location
//    _lastRecordedLocation = [locations lastObject];
//    
//    //add current location in co-ordinate array
//    [_locationArray addObject:[locations lastObject]];
//    
//    
//    CLLocationCoordinate2D coords[2];
//    coords[0] = ((CLLocation*)[locations lastObject]).coordinate;
//    coords[1] = _lastRecordedLocation.coordinate;
//    
//    
//    //MKPolyline
//    //polylineWithCoordinates:(CLLocationCoordinate2D *)coords count:(NSUInteger)count;
//    
//    MKPolyline *line = [MKPolyline polylineWithCoordinates:coords  count:2];
//    
//    MKPolylineRenderer *lineToDisplay = [[MKPolylineRenderer alloc ]initWithPolyline:line];
//    
//    [self.mapView addOverlay:lineToDisplay];
//    
//    //mapView addOverlay(lineToDisplay);
    
    
    NSLog(@"didUpdateLocations called, Location %@",locations);
 //   MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(locations.coordinate, 800, 800);
   // [_l_mapView setRegion:[_l_mapView regionThatFits:region] animated:YES];
}


- (void)mapView:(MKMapView *)mapView
didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
    NSLog(@"didUpdateUserLocation called");
   
    if(firstLocationUpdateReported == true)
    {
        
        firstLocationUpdateReported = false;
        [_locationArray addObject:userLocation.location];
    }
    
    //update last location
    _lastRecordedLocation = [_locationArray lastObject];
    
    //add current location in co-ordinate array
    [_locationArray addObject:userLocation.location];
    
       CLLocationCoordinate2D coords[2];
    coords[0] = userLocation.location.coordinate;
    coords[1] = _lastRecordedLocation.coordinate;
    NSLog(@"array %@",_locationArray);
    NSLog(@"FirstValue : %f , %f ", coords[0].latitude, coords[0].longitude);
     NSLog(@"SecondValue : %f , %f ", coords[1].latitude, coords[1].longitude);
   //  NSLog(@"location values two %@", coords[1]);
    //MKPolyline
    //polylineWithCoordinates:(CLLocationCoordinate2D *)coords count:(NSUInteger)count;
    
    MKPolyline *line = [MKPolyline polylineWithCoordinates:coords  count:2];
    
  //  MKPolylineRenderer *lineToDisplay = [[MKPolylineRenderer alloc ]initWithPolyline:line];
    
   // [lineToDisplay ]
      line.title = @"line";
    [self.mapView addOverlay:line];
  
    //mapView addOverlay(lineToDisplay);
    
    
}


- (MKOverlayRenderer *)mapView:(MKMapView *)mapView
            rendererForOverlay:(id<MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKPolyline class]])
    {
        
        MKPolylineRenderer*    aRenderer = [[MKPolylineRenderer alloc] initWithPolyline:(MKPolyline*)overlay];
     
        aRenderer.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];
        aRenderer.lineWidth = 6;
        return aRenderer;
    }
    return nil;
}

- (void)mapView:(MKMapView *)mapView
regionWillChangeAnimated:(BOOL)animated
{
    NSLog(@"regionWillChangeAnimated called");
    
}

@end
