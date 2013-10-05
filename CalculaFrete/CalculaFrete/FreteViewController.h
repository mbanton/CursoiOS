//
//  FreteViewController.h
//  CalculaFrete
//
//  Created by Aluno on 05/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreteSingleton.h"

@interface FreteViewController : UIViewController

@property (nonatomic, retain) IBOutlet FreteSingleton *freteSingleton;

@end
