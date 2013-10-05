//
//  LocationManager.m
//  CalculaFrete
//
//  Created by Aluno on 05/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager

@synthesize cepDetectado;

UILabel *responseLabel;
CLLocationManager *locationManager;
CLLocation *currentLocation;
NSString *DadosLocation;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"Location manager chamada.");
    
    /// Lógica
    DadosLocation = @"N";
    
    /// Controles
    responseLabel = (UILabel*) [self.view viewWithTag:1];
    responseLabel.text = @"Tentando ativar sensor localização...";
    
    
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

- (IBAction)close:(id)sender {
    
    NSLog(@"Fechando modal");
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


/// Não Autorizado
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    NSLog(@"Status: %u", status);
    if ( status == kCLAuthorizationStatusDenied )
    {
        responseLabel.text = @"DEU RUIM";
    }
}

/// Autorizado
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    if ([DadosLocation isEqualToString:@"N"])
    {
        /// Pega primeira localização
        currentLocation = [locations objectAtIndex:0];
        
        NSLog(@"Detected Location : %f, %f", currentLocation.coordinate.latitude, currentLocation.coordinate.longitude);
        
        /// Dados Localização
        [self DadosGoogle];
        
        //        /// Para de atualizar
        //        [locationManager stopUpdatingLocation];
        
        /// Marca como já coletado
        DadosLocation = @"S";
    }
}

- (void)DadosGoogle
{
    
    NSString *tmp = [NSString stringWithFormat:@"123456-000"];
    
    NSLog(@"Puxar dados do Google. CEP FAKE: %@", tmp);
    
    responseLabel.text = tmp;
    
    // Grava no singleton
    [[self freteSingleton] setCepDetectado:tmp];
    
    // grava no parametro de retorno
    cepDetectado.text = tmp;
    
//    NSString *url = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/xml?latlng=%f,%f&sensor=false", currentLocation.coordinate.latitude, currentLocation.coordinate.longitude];
//    NSLog(@"Google Request: %@", url);
//    
//    NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
//    
//    NSString *StringResponse = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    
//    /// Verifica se encontrou resultados... senão envia para tela de cadastro de dúvida
//    if ([StringResponse length] > 0)
//    {
//        NSLog(@"StringResponse: %@", StringResponse);
//        
//        NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLString:StringResponse];
//        
//        NSArray *aResult = [xmlDoc valueForKeyPath:@"result"];
//        
//        
//        
//        for (int i = 0; i < 1; i++) {
//            NSArray *aAdd = [[aResult objectAtIndex:i ] valueForKeyPath:@"address_component"];
//            
//            NSArray *oType = [aAdd valueForKeyPath:@"type"];
//            NSArray *oLongN = [aAdd valueForKeyPath:@"long_name"];
//            
//            NSLog(@"oType: %@", oType);
//            NSLog(@"oLongN: %@", [aAdd valueForKeyPath:@"long_name"]);
//            NSLog(@"oLongArray: %@", [oLongN objectAtIndex:3]);
//            
//            for (int i = 0; i < oType.count; i++) {
//                NSLog(@"%d - %@", i, [oType objectAtIndex:i]);
//                
//                @try {
//                    NSArray *Tipagem = [oType objectAtIndex:i];
//                    
//                    NSLog(@"TIIIIPP: %@",[Tipagem objectAtIndex:0]);
//                    if ([[Tipagem objectAtIndex:0] isEqualToString:@"locality"])
//                    {
//                        NSLog(@"Cidade.text: %@", [oLongN objectAtIndex:i]);
//                        Cidade.text = [oLongN objectAtIndex:i];
//                    }
//                }
//                @catch (NSException *exception) {
//                }
//                @finally {
//                }
//                
//            }
//            
//        }
//    }

}


@end
