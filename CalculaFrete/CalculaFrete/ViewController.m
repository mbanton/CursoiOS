//
//  ViewController.m
//  CalculaFrete
//
//  Created by Aluno on 05/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "ViewController.h"
#import "CorreiosWSResponse.h"


@implementation ViewController

UITextField *CepOrigem;
UITextField *CepDestino;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /// Controles
    CepOrigem = (UITextField *) [self.view viewWithTag:1];
    CepDestino = (UITextField *) [self.view viewWithTag:2];
    
    
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
    [controller setCepOrigem:((UITextField *) [self.view viewWithTag:1]).text];
    [controller setCepDestino:((UITextField *) [self.view viewWithTag:2]).text];
    [controller setAltura:((UITextField *) [self.view viewWithTag:3]).text];
    [controller setLargura:((UITextField *) [self.view viewWithTag:4]).text];
    [controller setPeso:((UITextField *) [self.view viewWithTag:5]).text];
    
    
    [self.navigationController pushViewController:controller animated:YES];
    
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if (textField == CepOrigem)
    {
        [CepDestino becomeFirstResponder];
    }
    else
    {
        [textField resignFirstResponder];
    }
    
    return NO;
}

@end
