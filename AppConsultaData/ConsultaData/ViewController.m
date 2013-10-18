//
//  ViewController.m
//  ConsultaData
//
//  Created by Aluno on 14/09/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "ViewController.h"
#import "Pessoa.h"
#import "SalvaDados.h"


@implementation ViewController

UITextField *BoxNome;
UITextField *BoxTelefone;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Criar os componentes via código
    UILabel *LabelNome = [[UILabel alloc] initWithFrame:
                          CGRectMake(10, 90, 100, 25)];
    
    BoxNome = [[UITextField alloc] initWithFrame:
                            CGRectMake(110, 90, 200, 25)];
    
    UILabel *LabelTelefone = [[UILabel alloc] initWithFrame:
                              CGRectMake(10, 140, 100,25)];
    
    BoxTelefone = [[UITextField alloc] initWithFrame:
                               CGRectMake(110, 140, 200, 25)];
    
    BoxNome.borderStyle = UITextBorderStyleRoundedRect;
    BoxTelefone.borderStyle = UITextBorderStyleRoundedRect;
    BoxNome.tag = 101;
    BoxTelefone.tag = 102;
    
    // Faço o delegate com essa propria classe
    BoxNome.delegate = self;
    BoxTelefone.delegate = self;
    
    
    LabelNome.Text = @"Nome: ";
    LabelTelefone.Text = @"Telefone: ";

    
    [self.view addSubview: LabelNome];
    [self.view addSubview: LabelTelefone];
    [self.view addSubview: BoxNome];
    [self.view addSubview: BoxTelefone];
    
     
}

- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"TExt Did Begin TAG: %ld", (long) textField.tag);
}

- (void) textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"TExt Did End TAG: %ld", (long) textField.tag);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doTestar:(id)sender {
    
    NSLog(@"Nome: %@", BoxNome.text);
    
    NSLog(@"Telefone: %@", BoxTelefone.text);
    
    Pessoa *objPessoa = [[Pessoa alloc] init];
    objPessoa.Nome = BoxNome.text;
    objPessoa.Telefone = BoxTelefone.text;
    
    SalvaDados *Controller = [self.storyboard
                                    instantiateViewControllerWithIdentifier:@"SalvaDados"];

    Controller.objPessoa = objPessoa;

    [self.navigationController pushViewController:Controller animated: YES];
    
    

}
@end
