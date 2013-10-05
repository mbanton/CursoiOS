//
//  ViewController.h
//  CalculaFrete
//
//  Created by Aluno on 05/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreteViewController.h"
#import "CorreiosWSResponse.h"
#import "LocationManager.h"

@interface ViewController : FreteViewController<UITextFieldDelegate>
- (IBAction)buscaValor:(id)sender;
- (IBAction)detectarCep:(id)sender;

@end
