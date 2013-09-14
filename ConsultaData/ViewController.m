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
                          CGRectMake(10, 10, 100, 25)];
    
    BoxNome = [[UITextField alloc] initWithFrame:
                            CGRectMake(110, 10, 200, 25)];
    
    UILabel *LabelTelefone = [[UILabel alloc] initWithFrame:
                              CGRectMake(10,60, 100,25)];
    
    BoxTelefone = [[UITextField alloc] initWithFrame:
                               CGRectMake(110, 60, 200, 25)];
    
    BoxNome.borderStyle = UITextBorderStyleRoundedRect;
    BoxTelefone.borderStyle = UITextBorderStyleRoundedRect;
    BoxNome.tag = 10;
    BoxTelefone.tag = 11;
    
    
    LabelNome.Text = @"Nome: ";
    LabelTelefone.Text = @"Telefone: ";

    
    [self.view addSubview: LabelNome];
    [self.view addSubview: LabelTelefone];
    [self.view addSubview: BoxNome];
    [self.view addSubview: BoxTelefone];
    
     
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
