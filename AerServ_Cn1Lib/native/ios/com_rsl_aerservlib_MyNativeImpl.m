#import "com_rsl_aerservlib_MyNativeImpl.h"
#import "CodenameOne_GLViewController.h"
#import "AerServSDK.h"

@interface com_rsl_aerservlib_MyNativeImpl ()<ASInterstitialViewControllerDelegate, ASAdViewDelegate>

@end

@implementation com_rsl_aerservlib_MyNativeImpl

//@synthesize adController;

- (UIViewController *)viewControllerForPresentingModalView {
    return [CodenameOne_GLViewController instance];//self;
}

-(void)setProduction{}
-(void)onCreate{ //THIS METHOD GETS CALLED FIRST
    NSLog(@"onCreate()");
    self.adController = [[ASInterstitialViewController alloc] viewControllerForPlacementID:1000741 withDelegate:self];
    //self.adController.showOutline = YES;
    NSLog(@"a()");
    [self.adController loadAd];
    NSLog(@"b()");
    [self.adController showFromViewController:self];
    NSLog(@"c()");
    
    
    
 //[self showInterstitial];
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

@end