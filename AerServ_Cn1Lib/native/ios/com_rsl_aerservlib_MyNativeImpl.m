#import "com_rsl_aerservlib_MyNativeImpl.h"
#import "CodenameOne_GLViewController.h"
#import "AerServSDK.h"

//moved this into header, and removed self from all the references to the vars etc
/*@interface com_rsl_aerservlib_MyNativeImpl ()<ASInterstitialViewControllerDelegate, ASAdViewDelegate> //is this right????

@property (strong, nonatomic) ASInterstitialViewController* adController;
@property (nonatomic, assign) BOOL isLoaded;

@end*/
 ASInterstitialViewController* adController;
BOOL isLoaded;
@implementation com_rsl_aerservlib_MyNativeImpl

- (UIViewController *)viewControllerForPresentingModalView { // never gets called
    NSLog(@"viewControllerForPresentingModalView()");
    return [CodenameOne_GLViewController instance];//.view;//self;//[CodenameOne_GLViewController instance];//self;
}

-(void)setProduction{}


+(void)calledFromBuildHint{
 NSLog(@"calledFromBuildHint()GAZ");
   }

-(void)onCreate{
    dispatch_async(dispatch_get_main_queue(), ^{
    //this does the work, but it still doesnt work, advert times out, even though on native one it doesnt time out.
                //only difference I see is that native on does work in viewDidAppear, can that make a difference?
    NSLog(@"onCreate()GAZ");
    isLoaded = NO;
    NSLog(@"a()");
    adController = [[ASInterstitialViewController alloc] viewControllerForPlacementID:@"1000741" withDelegate:self];
    NSLog(@"b()");
    adController.isPreload = YES;
    NSLog(@"c()");
    [adController loadAd];
    NSLog(@"d()");
         });
}

-(void)setDev{}
-(void)onPause{}
-(void)pauseBanner{}
-(void)showBanner{}
-(void)onDestroy{}
-(void)onResume{}
-(void)playBanner{}
-(void)setStaging{}
-(BOOL)isSupported{
    return YES;
}

NSString *myPlc = @"...";
- (void)setPlc:(NSString *) plc {
    NSLog(@"setPlc()");
    NSLog(@"___The plc is %@", plc);
    myPlc=plc;
}

- (NSString *)getPlc {
    NSLog(@"getPlc()");
    return myPlc;
    
}

- (void)preloadInterstitial {
    NSLog(@"preloadInterstitial()");
}

- (void)loadInterstitial {
    NSLog(@"loadInterstitial()");
    
}
- (void)showInterstitial {
    NSLog(@"showInterstitial()");
}

//////////////////////////////////

/// Ad Preloaded ///
- (void)interstitialViewControllerDidPreloadAd:(ASInterstitialViewController *)viewController {
    NSLog(@"interstitialViewControllerDidPreloadAd");
    isLoaded = YES;
    [adController showFromViewController:[CodenameOne_GLViewController instance]];//self];
}
/// Ad loaded ///
- (void)interstitialViewControllerAdLoadedSuccessfully:(ASInterstitialViewController *)viewController {
    NSLog(@"Ad loaded");
    isLoaded = YES;
    [adController showFromViewController:[CodenameOne_GLViewController instance]];//self];
}
/// Ad Failed ///
- (void)interstitialViewControllerAdFailedToLoad:(ASInterstitialViewController*)viewController withError:(NSError*)error {
    NSLog(@"////Ad Failed to load with error:%@", error);
}
/// Ad Clicked ///
- (void)interstitialViewControllerAdWasTouched:(ASInterstitialViewController *)viewController {
    NSLog(@"ad was touched");
}
/// Ad Dismissed ///
- (void)interstitialViewControllerDidDisappear:(ASInterstitialViewController *)viewController {
    adController = nil;
    NSLog(@"ad dismissed");
}

@end
