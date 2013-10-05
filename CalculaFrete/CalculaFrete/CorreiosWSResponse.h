//
//  CorreiosWSResponse.h
//  CalculaFrete
//
//  Created by Aluno on 05/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreteViewController.h"

@interface CorreiosWSResponse : FreteViewController

@property (nonatomic, retain) IBOutlet NSString *cepOrigem;
@property (nonatomic, retain) IBOutlet NSString *cepDestino;
@property (nonatomic, retain) IBOutlet NSString *peso;
@property (nonatomic, retain) IBOutlet NSString *altura;
@property (nonatomic, retain) IBOutlet NSString *largura;



@end
