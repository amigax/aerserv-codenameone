//
//  ASFileManager.h
//  AerServSDK
//
//  Created by Albert Zhu on 5/20/15.
//  Copyright (c) 2015 AerServ, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kVersionFileName @"VERSION"

@interface ASFileManager : NSObject

// singleton
- (ASFileManager *)manager;

// pulls version number from VERSION file, only works for apps that include the VERSION file in its bundle
+ (NSString *)readVersionFromBundle;



@end
