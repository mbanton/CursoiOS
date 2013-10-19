//
//  RootSingleton.h
//  Player
//
//  Created by Marcelo Anton on 19/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RootSingleton : NSObject

// Constants
#define SERVICE_GENRE_URL @"http://www.naprainha.com.br/service.php?srv=genre"
#define SERVICE_MUSIC_URL_BASE @"http://www.naprainha.com.br/service.php?srv=music&idEtiquetaPai=6"
#define MUSIC_STREAM_URL_BASE @"https://s3-sa-east-1.amazonaws.com/naprainha/musicas/"
#define MUSIC_STREAM_EXTENSION @".mp3"


// Singleton Properties


// Used to reuse singleton object in all App
+ (id)sharedManager;

@end

