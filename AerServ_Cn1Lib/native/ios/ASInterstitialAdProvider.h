//
//  ASAdProvider.h
//  AerServSDK
//
//  Created by Scott A Andrew on 4/9/14.
//  Copyright (c) 2014 AerServ, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*! @header
 * Class that must be impletented to provide interstitial ads to AerServ. */

extern const NSString *ASInterstitialParameter_Parameters;
extern const NSString *ASInterstitialParameter_HTMLHeaders;
extern const NSString *ASInterstitialParameter_HTMLData;
extern const NSString *ASInterstitialParameter_Parameter_URL;
extern const NSString *ASInterstitialParameter_Location;

@protocol ASInterstitialAdProviderDelegate;

@interface ASInterstitialAdProvider : NSObject

@property (nonatomic, weak) id<ASInterstitialAdProviderDelegate> delegate;
@property (nonatomic, assign) BOOL outlineAd;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, assign) BOOL shouldShowAd;
@property (nonatomic, assign) NSTimeInterval timeoutInt;

- (void)requestInterstitialAdWithProperties:(NSDictionary *)info isPreload:(BOOL)preload;;
- (BOOL)enableAutomaticImpressionAndClickTracking;
- (void)showInterstitialFromRootViewController:(UIViewController *)rootViewController;
- (void)cancel;

@end


/* Delegate calls that the interstitial ad provider must call. */

@protocol ASInterstitialAdProviderDelegate <NSObject>

@property (nonatomic, copy) NSString *closeOffset;

- (void)interstitialAdProvider:(ASInterstitialAdProvider *)provider didLoadAd:(id)ad;
- (void)interstitialAdProvider:(ASInterstitialAdProvider *)provider didFailToLoadAdWithError:(NSError *)error;
- (void)interstitialAdProviderDidExpire:(ASInterstitialAdProvider *)provider;
- (void)interstitialAdProvider:(ASInterstitialAdProvider *)provider didPreloadAd:(id)ad;
- (void)interstitialAdProviderDidAdComplete:(ASInterstitialAdProvider *)provider;

- (void)interstitialAdProvider:(ASInterstitialAdProvider *)provider didVirtualCurrencyLoad:(NSDictionary *)vcData;
- (void)interstitialAdProvider:(ASInterstitialAdProvider *)provider didVirtualCurrencyReward:(NSDictionary *)vcData;

- (void)interstitialAdProviderWillAppear:(ASInterstitialAdProvider *)provider;
- (void)interstitialAdProviderDidAppear:(ASInterstitialAdProvider *)provider;

- (void)interstitialAdProviderWillDisappear:(ASInterstitialAdProvider *)provider;
- (void)interstitialAdProviderDidDisappear:(ASInterstitialAdProvider *)provider;

- (void)interstitialAdProviderAdWasTouched:(ASInterstitialAdProvider *)provider;

- (BOOL)interstitialAdProviderIsPreload:(ASInterstitialAdProvider *)provider;

- (NSArray*)getKeyWords;
- (NSDictionary*)getPubKeys;
- (void)AVPlayerCreated:(AVPlayer *)avPlayer;


@end
