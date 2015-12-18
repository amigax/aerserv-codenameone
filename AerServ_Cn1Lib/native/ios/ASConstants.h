//
//  kAerServConstants.h
//  AerServSDK
//
//  Created by Albert Zhu on 6/5/15.
//  Copyright (c) 2015 AerServ, LLC. All rights reserved.
//

#ifndef AerServSDK_AerServConstants_h
#define AerServSDK_AerServConstants_h

typedef NS_ENUM(NSUInteger, ASEnvironmentType) {
    kASEnvProduction,
    kASEnvStaging,
    kASEnvDevelopment
};

#define kIS_iOS_6 ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0 && [[UIDevice currentDevice].systemVersion floatValue] < 7.0)
#define kIS_iOS_6_OR_LATER ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)
#define kIS_iOS_7_OR_LATER ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
#define kIS_iOS_8_OR_LATER ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
#define kIS_iOS_9_OR_LATER ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0)

#define kIS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#endif