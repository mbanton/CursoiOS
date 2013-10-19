//
//  MinhaSessao.m
//  SIngleton
//
//  Created by Jorge Luis Beckel Flor on 10/5/13.
//  Copyright (c) 2013 Jorge Flor. All rights reserved.
//

#import "MinhaSessao.h"

@implementation MinhaSessao

+ (id)sharedManager {
    static MinhaSessao *sharedMyManager = nil;
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
