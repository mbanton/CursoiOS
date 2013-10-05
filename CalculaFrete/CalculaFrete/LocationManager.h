//
//  LocationManager.h
//  CalculaFrete
//
//  Created by Aluno on 05/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreteViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationManager : FreteViewController<CLLocationManagerDelegate>

@property (nonatomic, retain) IBOutlet UILabel *cepDetectado;

- (IBAction)close:(id)sender;

@end
