//
//  RMapScreenViewController.h
//  Dropped
//
//  Created by Ravinder Vatish on 12/3/14.
//  Copyright (c) 2014 Ravinder Vatish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface RMapScreenViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate, MKOverlay>
{
    BOOL firstLocationUpdateReported;
}
@property (strong, nonatomic)CLLocation *lastRecordedLocation;
//@property (strong, nonatomic)CLLocation

@property (strong, nonatomic) NSMutableArray* locationArray;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
