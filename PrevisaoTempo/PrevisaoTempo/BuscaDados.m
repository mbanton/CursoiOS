//
//  BuscaDados.m
//  PrevisaoTempo
//
//  Created by Aluno on 05/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "BuscaDados.h"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1


@implementation BuscaDados

@synthesize nomeCidade;

UIActivityIndicatorView *loader;

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

    NSLog(@"Recebi a cidade %@ vou buscar ela no WS ", nomeCidade);
    
    loader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [loader setFrame:CGRectMake(25, 25, 50, 50)];
    
    [self.view addSubview:loader];
    
    [loader startAnimating];
    
    
    NSString *url = [[NSString alloc] initWithFormat:@"http://www.previsaodotempo.org/apiX.php?city=%@", nomeCidade];
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *Caminho = [NSURL URLWithString:url];
    
    NSLog(@"Chamando com a url: %@", url);
    
    
    @try {
        
        dispatch_async(kBgQueue, ^{
            NSLog(@"1");
            NSData *Data = [NSData dataWithContentsOfURL:Caminho];
            NSLog(@"2");
            
            [self performSelectorOnMainThread:@selector(CallbackJSon:) withObject:Data waitUntilDone:YES];
            
            NSLog(@"PASSEI POR AQUI");
            
            //[self performSelectorOnMainThread:@selector(stopLoader:) withObject:nil waitUntilDone:YES];
            
            //NSLog(@"Acabei o trecho async");
            
            // NAO ROLA AQUI
            [loader stopAnimating];
            
            NSLog(@"FIM");
        });
        
    }
    @catch (NSException *exception) {
        NSLog(@"GENERIC ERROR %@", exception);
    }

    
    
}

- (void) stopLoader
{
    [loader stopAnimating];
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
    
    NSLog(@"ERRO: %@", error);
    
    
    if ( error )
    {
        NSLog(@"ERRO: %@", error);
        
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"ERRO" message: [NSString stringWithFormat: @"Ops... %@", error] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alerta show];
        
        [self.navigationController popToRootViewControllerAnimated:true];
        
    }
    
    NSLog(@"jSon: %@", jSon);
    NSArray* jSonData = [jSon objectForKey:@"data"]; //2
    
    NSLog(@"jSonData: %@", jSonData); //3
    
    
    NSLog(@"Location: %@", [(NSDictionary *)jSonData objectForKey:@"location"]);
    
    
    
    NSLog(@"-------------------");
    NSLog(@"apiVersion: %@", [jSon objectForKey:@"apiVersion"]);
    
    NSString* errorStr = [(NSDictionary *) jSonData objectForKey: @"error"];
    
    if ( errorStr )
    {
        NSLog(@"ERRO: %@", errorStr);
        
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"ERRO" message: [NSString stringWithFormat: @"Ops... %@", errorStr] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alerta show];
        
        [self.navigationController popToRootViewControllerAnimated:true];
        
    
    } else {
        
        UILabel *Cidade = (UILabel *)[self.view viewWithTag:1];
        UILabel *Temperatura = (UILabel *)[self.view viewWithTag:2];
        
        
        Cidade.text =[(NSDictionary *)jSonData objectForKey:@"location"];
        NSString *TempC = [NSString stringWithFormat:@"%.1fº",(([[(NSDictionary *)jSonData objectForKey:@"temperature"] doubleValue] -32) / 1.8)];
        Temperatura.text = TempC;
        
        NSLog(@"TempC: %@", TempC);
        // C
        //-32 *1.8
    }
    
    
    
}


@end
