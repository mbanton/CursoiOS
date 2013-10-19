//
//  ViewController.m
//  jSon
//
//  Created by Jorge Flor on 10/3/13.
//  Copyright (c) 2013 Jorge Flor. All rights reserved.
//

#import "ViewController.h"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *Caminho = [NSURL URLWithString:@"http://www.previsaodotempo.org/api.php?city=Porto%20Alegre"];
    
    dispatch_async(kBgQueue, ^{
        NSData *Data = [NSData dataWithContentsOfURL:Caminho];
        [self performSelectorOnMainThread:@selector(CallbackJSon:) withObject:Data waitUntilDone:YES];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) CallbackJSon: (NSData *) dataResponse
{
    NSError *error;
    NSDictionary *jSon = ([NSJSONSerialization JSONObjectWithData:dataResponse options:kNilOptions error:&error]);

    NSLog(@"jSon: %@", jSon);
    NSArray* jSonData = [jSon objectForKey:@"data"]; //2
    
    NSLog(@"jSonData: %@", jSonData); //3
    
    
    NSLog(@"Location: %@", [(NSDictionary *)jSonData objectForKey:@"location"]);
    
    
    
    NSLog(@"-------------------");
    NSLog(@"apiVersion: %@", [jSon objectForKey:@"apiVersion"]);
    
    
    UILabel *Cidade = (UILabel *)[self.view viewWithTag:1];
    UILabel *Temperatura = (UILabel *)[self.view viewWithTag:2];
    
    
    Cidade.text =[(NSDictionary *)jSonData objectForKey:@"location"];
    NSString *TempC = [NSString stringWithFormat:@"%.1fº",(([[(NSDictionary *)jSonData objectForKey:@"temperature"] doubleValue] -32) / 1.8)];
    Temperatura.text = TempC;
    
    NSLog(@"TempC: %@", TempC);
    // C
    //-32 *1.8
    
}

@end
