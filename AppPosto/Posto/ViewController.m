//
//  ViewController.m
//  Posto
//
//  Created by Aluno on 28/09/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

// ScrollView poderá ser reusado
UIScrollView *myScroll;

- (void)viewDidLoad
{

    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    myScroll = (UIScrollView*) [self.view viewWithTag:101];
    [myScroll setContentSize:CGSizeMake(740, 1000)];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)FazerLogin:(id)sender {
    NSLog(@"Efetuando procedimento de login");
    
    UITextField *Login = (UITextField *) [self.view viewWithTag:11];
    UITextField *Senha = (UITextField *) [self.view viewWithTag:12];
    
    if ([Login.text isEqualToString:@"admin"]) {
        NSLog(@"Login eh admin");
        
        if ( [Senha.text isEqualToString:@"admin"])
        {
            NSLog(@"Senha eh admin, vamos logar");
            
             UIViewController *controller = [self.storyboard
                                             instantiateViewControllerWithIdentifier:@"ListaPostosScreen" ];

            [self.navigationController pushViewController:controller animated:YES];
            
        }
        else
        {
            NSLog(@"Senha errada.");
            
            UIAlertView *Alerta = [[UIAlertView alloc] initWithTitle:@"Senha inválido." message:@"Ops... A senha nao eh esta." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [Alerta show];
            
        }
        
    }
    else
    {
        NSLog(@"Login errado.");
        
        UIAlertView *Alerta = [[UIAlertView alloc] initWithTitle:@"Login inválido." message:@"Ops... Login nao eh este." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [Alerta show];
        
    }

}

- (IBAction)LimparCampos:(id)sender {
    UITextField *Login = (UITextField *) [self.view viewWithTag:11];
    UITextField *Senha = (UITextField *) [self.view viewWithTag:12];
    Login.text = @"";
    Senha.text = @"";
}


@end
