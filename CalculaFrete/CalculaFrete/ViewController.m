//
//  ViewController.m
//  CalculaFrete
//
//  Created by Aluno on 05/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "ViewController.h"


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

- (IBAction)buscaValor:(id)sender {
    
    CorreiosWSResponse* controller = (CorreiosWSResponse*) [self.storyboard
     instantiateViewControllerWithIdentifier:@"CorreiosWSResponseScreen"];
    
    
    // Parametros
    [controller setCepOrigem:((UILabel *) [self.view viewWithTag:1]).text];
    [controller setCepDestino:((UITextField *) [self.view viewWithTag:2]).text];
    [controller setAltura:((UITextField *) [self.view viewWithTag:3]).text];
    [controller setLargura:((UITextField *) [self.view viewWithTag:4]).text];
    [controller setPeso:((UITextField *) [self.view viewWithTag:5]).text];
    
    
    [self.navigationController pushViewController:controller animated:YES];
    
}

- (IBAction)detectarCep:(id)sender {
    LocationManager* controller = (LocationManager*) [self.storyboard
                                                            instantiateViewControllerWithIdentifier:@"LocationManagerScreen"];
    
    // Parametros
    [controller setCepDetectado: (UILabel *) [self.view viewWithTag:1]];
    
    [self.navigationController presentViewController:controller animated:YES completion:nil];
     

}


- (BOOL) textFieldShouldReturn:(UITextField *)textField
{

    [textField resignFirstResponder];
    return NO;
}

@end
