//
//  ASAlertManager.h
//  AerServSDK
//
//  Created by Albert Zhu on 6/23/15.
//  Copyright (c) 2015 AerServ, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kShowAlert 1

@interface ASAlertManager : NSObject

+ (void)showAlertWithMessage:(NSString *)msg forTimeInt:(NSTimeInterval)interval;

@end
