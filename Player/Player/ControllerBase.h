//
//  ControllerBase.h
//  Player
//
//  Created by Marcelo Anton on 19/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singleton.h"

@interface ControllerBase : UIViewController

@property (nonatomic, retain) IBOutlet Singleton *iSingleton;

@end
