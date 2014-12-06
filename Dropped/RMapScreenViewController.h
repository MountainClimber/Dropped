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

@interface RMapScreenViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *l_mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
