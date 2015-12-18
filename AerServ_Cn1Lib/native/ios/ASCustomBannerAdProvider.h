//
//  ASCustomBannerAdProvider.h
//  AerServSDK
//
//  Copyright (c) 2015 AerServ, LLC. All rights reserved.
//

#import "ASBannerAdProvider.h"

#define kCustomBannerAdTimeout 15.0f

@interface ASCustomBannerAdProvider : ASBannerAdProvider

- (id)initWithAdClassName:(NSString *)adClassName timeout:(NSTimeInterval)timeout;

- (void)initializePartnerAd:(NSDictionary *)properties;
- (BOOL)hasPartnerAdInitialized;
- (BOOL)hasPartnerAdFailedToInitialize;
- (void)loadPartnerAd:(NSDictionary *)properties;
- (BOOL)hasPartnerAdLoaded;
- (BOOL)hasPartnerAdFailedToLoad;
- (void)showPartnerAd;
- (void)terminatePartnerAd;
- (NSString *)valueInProperty:(NSDictionary *)properties forKey:(NSString *)key;

- (UIViewController *)asBannerViewController;
- (UIView *)partnerAdView;

- (void)asPartnerBannerAdWasClicked;
- (void)asPartnerBannerDidShowAdCompletely;
- (void)asPartnerBannerWillEndAction;
- (void)asPartnerBannerWillLeaveApplication;
- (void)asPartnerBannerWillBeginAction;

@end