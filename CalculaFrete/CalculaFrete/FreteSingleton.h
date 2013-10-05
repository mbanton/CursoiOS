//
//  FreteSingleton.h
//  CalculaFrete
//
//  Created by Aluno on 05/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FreteSingleton : NSObject

@property (nonatomic, retain) IBOutlet NSString *cepDetectado;

+ (id)sharedManager;

@end
