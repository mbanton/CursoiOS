//
//  RootController.h
//  Player
//
//  Created by Marcelo Anton on 19/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootSingleton.h"

@interface RootController : UIViewController

@property (nonatomic, retain) IBOutlet RootSingleton *singleton;

@end
