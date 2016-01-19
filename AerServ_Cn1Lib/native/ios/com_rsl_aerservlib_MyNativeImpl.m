#import "com_rsl_aerservlib_MyNativeImpl.h"
#import "CodenameOne_GLViewController.h"
#import "AerServSDK.h"
#import "com_rsl_aerservlib_Callback.h"

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

NSString *myPlc = @"1000741";
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
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"preloadInterstitial()");
        //this does the work, but it still doesnt work, advert times out, even though on native one it doesnt time out.
        //only difference I see is that native on does work in viewDidAppear, can that make a difference?
        NSLog(@"___________..");
        isLoaded = NO;
        NSLog(@"___________a()");
        adController = [[ASInterstitialViewController alloc] viewControllerForPlacementID:myPlc withDelegate:self];
        NSLog(@"___________b()");
        adController.isPreload = YES;
        NSLog(@"___________c()");
       // [adController loadAd];
       // NSLog(@"d()");
    });

}

- (void)loadInterstitial {
    NSLog(@"loadInterstitial()");
    
}
- (void)showInterstitial {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"showInterstitial()");
        [adController loadAd];
        NSLog(@"___________d()");
    });

}

//////////////////////////////////

/// Ad Preloaded ///
- (void)interstitialViewControllerDidPreloadAd:(ASInterstitialViewController *)viewController {
    NSLog(@"interstitialViewControllerDidPreloadAd");
    isLoaded = YES;
    [adController showFromViewController:[CodenameOne_GLViewController instance]];//self];

    com_rsl_aerservlib_Callback_advertPreloaded__(CN1_THREAD_GET_STATE_PASS_SINGLE_ARG);
}
/// Ad loaded ///
- (void)interstitialViewControllerAdLoadedSuccessfully:(ASInterstitialViewController *)viewController {
    NSLog(@"Ad loaded");
    isLoaded = YES;
    [adController showFromViewController:[CodenameOne_GLViewController instance]];//self];

    com_rsl_aerservlib_Callback_advertLoaded__(CN1_THREAD_GET_STATE_PASS_SINGLE_ARG);
}
/// Ad Failed ///
- (void)interstitialViewControllerAdFailedToLoad:(ASInterstitialViewController*)viewController withError:(NSError*)error {
    NSLog(@"////Ad Failed to load with error:%@", error);

    com_rsl_aerservlib_Callback_advertFailed__(CN1_THREAD_GET_STATE_PASS_SINGLE_ARG);
}
/// Ad Clicked ///
- (void)interstitialViewControllerAdWasTouched:(ASInterstitialViewController *)viewController {
    NSLog(@"ad was touched");

    com_rsl_aerservlib_Callback_advertClicked__(CN1_THREAD_GET_STATE_PASS_SINGLE_ARG);
}
/// Ad Dismissed ///
- (void)interstitialViewControllerDidDisappear:(ASInterstitialViewController *)viewController {
    adController = nil;
    NSLog(@"ad dismissed OR FINISHED.");
    //this is what is called when the advert ends or is cancelled, we want a call back into the java for this so we know when its ended.
    com_rsl_aerservlib_Callback_advertDismissed__(CN1_THREAD_GET_STATE_PASS_SINGLE_ARG);
}

@end
