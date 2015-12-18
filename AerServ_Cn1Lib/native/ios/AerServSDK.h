//
// iOS side of AerServ lib adapted from their sample
// By Gareth Murfin.

#import <Foundation/Foundation.h>

#import "ASConstants.h"
#import "ASAdView.h"
#import "ASInterstitialViewController.h"
#import "ASFileManager.h"
#import "ASAlertManager.h"
#import "ASCustomBannerAdProvider.h"
#import "ASCustomInterstitialAdProvider.h"

@interface AerServSDK : NSObject

/*!
 * Looks into each supplied placement and will run pre-initialization for any mediation partner sources that requires an extra setup phase.
 *
 * @param plcArr, an array of string placement ids (i.e. @[@"1002090", @"1005992"])
 */
+ (void)initializeWithPlacments:(NSArray *)plcArr;

/*!
 * Looks into the supplied site id and will run pre-initialization for any mediation partner sources that requires an extra setup phase.
 *
 * @param siteIdStr, a string of the site id
 */
+ (void)initializeWithSiteID:(NSString *)siteIdStr;

@end
