//
//  ASCustomInterstitialAdProvider.h
//  AerServSDK
//
//  Copyright (c) 2015 AerServ, LLC. All rights reserved.
//

#import "ASInterstitialAdProvider.h"
#import <Foundation/Foundation.h>

#define kCustomInterstitialTimeout 15.0f

@interface ASCustomInterstitialAdProvider : ASInterstitialAdProvider

- (id)initWithAdClassName:(NSString *)adClassName timeout:(NSTimeInterval)timeout;

- (void)initializePartnerAd:(NSDictionary *)properties;
- (BOOL)hasPartnerAdInitialized;
- (BOOL)hasPartnerAdFailedToInitialize;
- (void)loadPartnerAd:(NSDictionary *)properties;
- (BOOL)hasPartnerAdLoaded;
- (BOOL)hasPartnerAdFailedToLoad;
- (void)showPartnerAd:(UIViewController *)rootViewController;
- (void)terminatePartnerAd;
- (NSString *)valueInProperty:(NSDictionary *)properties forKey:(NSString *)key;

- (void)asPartnerInterstitialAdWillDisappear;
- (void)asPartnerInterstitialAdDidDisappear;
- (void)asPartnerInterstitialAdWillAppear;
- (void)asPartnerInterstitialAdDidAppear;
- (void)asPartnerInterstitialAdWasTouched;
- (void)asPartnerInterstitialVideoCompleted;

@end
