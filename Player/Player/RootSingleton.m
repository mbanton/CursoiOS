//
//  RootSingleton.m
//  Player
//
//  Created by Marcelo Anton on 19/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "RootSingleton.h"

@implementation RootSingleton

+ (id)sharedManager {
    static RootSingleton *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

@end
