//
//  RootSingleton.h
//  Player
//
//  Created by Marcelo Anton on 19/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RootSingleton : NSObject

// Singleton Properties


// Used to reuse singleton object in all App
+ (id)sharedManager;

@end

