//
//  ASBannerAdProvider.h
//  AerServSDK
//
//  Created by Scott A Andrew on 4/14/14.
//  Copyright (c) 2014 AerServ, LLC. All rights reserved.
//

/*! @header
 * Class that must be implemented to provide banners ads to AerServ. */

#import <AVFoundation/AVFoundation.h>

extern const NSString *ASBannerParameter_Parameters;
extern const NSString *ASBannerParameter_HTMLHeaders;
extern const NSString *ASBannerParameter_HTMLData;
extern const NSString *ASBannerParameter_Parameter_URL;
extern const NSString *ASBannerParameter_Location;

@class ASAdView;
@class ASMRAIDView;

@protocol ASBannerAdProviderDelegate;

@interface ASBannerAdProvider : NSObject

@property (nonatomic, weak) id<ASBannerAdProviderDelegate> delegate;
@property (nonatomic, assign) BOOL outlineAd;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, assign) NSTimeInterval timeInt;

- (void)rotateToOrientation:(UIInterfaceOrientation)newOrientation;
- (void)requestAdWithSize:(CGSize)size withProperties:(NSDictionary *)properties isPreload:(BOOL)preload;
- (void)startPreloadedBannerAd;
- (void)stopAutomaticallyRefreshingAds;
- (void)startAutomaticallyRefreshingAds;
- (void)cancel;

@end

@protocol ASBannerAdProviderDelegate <NSObject>

- (UIViewController *)viewControllerForPresentingModalView;

- (void)bannerProvider:(ASBannerAdProvider *)provider didLoadAd:(UIView *)ad;
- (void)bannerProvider:(ASBannerAdProvider *)provider didFailToLoadAdWithError:(NSError *)error;

- (void)bannerProviderWillBeginAction:(ASBannerAdProvider *)provider;
- (void)bannerProviderWillEndAction:(ASBannerAdProvider *)provider;

- (void)bannerProviderWillLeaveApplication:(ASBannerAdProvider *)provider;
- (void)bannerProviderAdChangedSize:(ASBannerAdProvider *)provider;
- (void)bannerProviderAdWasClicked:(ASBannerAdProvider *)provider;
- (void)bannerProviderDidShowAdCompletely:(ASBannerAdProvider *)provider;

- (NSArray*) getKeyWords;
- (NSDictionary*) getPubKeys;

- (void)AVPlayerCreated:(AVPlayer *)avPlayer;

- (void)bannerProvider:(ASBannerAdProvider *)provider willChangeFrameTo:(CGRect)newFrame;
- (ASAdView *)bannerProviderWillGetAdView:(ASBannerAdProvider *)provider;
- (UIView *)bannerProviderWillGetContentView:(ASBannerAdProvider *)provider;
- (void)bannerProvider:(ASBannerAdProvider *)provider willSetContentViewToMRAIDView:(ASMRAIDView *)mraidView;
- (void)bannerProvider:(ASBannerAdProvider *)provider didLoadPlayerLayer:(AVPlayerLayer *)pl;

- (BOOL)bannerProviderAdAttemptIsPreload:(ASBannerAdProvider *)provider;

@end
