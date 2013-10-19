//
//  MinhaSessao.h
//  SIngleton
//
//  Created by Jorge Luis Beckel Flor on 10/5/13.
//  Copyright (c) 2013 Jorge Flor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MinhaSessao : NSObject

@property (nonatomic, retain) IBOutlet NSString *Nome;


+ (id)sharedManager;

@end
