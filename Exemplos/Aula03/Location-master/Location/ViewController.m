//
//  ViewController.m
//  Location
//
//  Created by Jorge Luis Beckel Flor on 10/5/13.
//  Copyright (c) 2013 Jorge Luis Beckel Flor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

CLLocationManager *locationManager;
CLLocation *currentLocation;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /// Location
    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/// Não Autorizado
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status != 3) {
        NSLog(@"Usuário Não Autorizou!");
    }
}

/// Autorizado
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {

    /// Pega primeira localização
    currentLocation = [locations objectAtIndex:0];
    
    NSLog(@"Detected Location : %f, %f", currentLocation.coordinate.latitude, currentLocation.coordinate.longitude);
    
    UILabel *lat = (UILabel *)[self.view viewWithTag:1];
    UILabel *lon = (UILabel *)[self.view viewWithTag:2];
    
    
    lat.text = [NSString stringWithFormat:@"%f", currentLocation.coordinate.latitude];
    lon.text = [NSString stringWithFormat:@"%f", currentLocation.coordinate.longitude];
    
}

@end
