//
//  ViewController.m
//  PrevisaoTempo
//
//  Created by Aluno on 05/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "ViewController.h"
#import "BuscaDados.h"


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicadoBuscar:(id)sender {
    
    UITextView *cidadeBuscada = (UITextView*) [self.view viewWithTag:101];
    NSString *cidadeTxt = cidadeBuscada.text;
    
    if ( [ cidadeTxt length] == 0 ) {
        
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Digitea uma cidade" message:@"Ops... Digite a cidade.." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alerta show];
        
    } else {
        NSLog(@"Ok, vamos navegar buscando a cidade %@", cidadeTxt);
        
        BuscaDados *controller = [self.storyboard
                                        instantiateViewControllerWithIdentifier:@"BuscaDadosScreen"];
        
        
        [controller setNomeCidade: cidadeTxt];
        
        [self.navigationController pushViewController:controller animated:YES];
        
        NSLog(@"ESTE LOG VAI PARA ONDE");
        

        
    }
    
    
}
@end
