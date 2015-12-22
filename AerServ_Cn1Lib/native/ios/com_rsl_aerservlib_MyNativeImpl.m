#import "com_rsl_aerservlib_MyNativeImpl.h"
#import "CodenameOne_GLViewController.h"
#import "AerServSDK.h"

@interface com_rsl_aerservlib_MyNativeImpl ()<ASInterstitialViewControllerDelegate, ASAdViewDelegate>

@property (strong, nonatomic) ASInterstitialViewController* adController;
@property (nonatomic, assign) BOOL isLoaded;

@end

@implementation com_rsl_aerservlib_MyNativeImpl

- (UIViewController *)viewControllerForPresentingModalView {
    return [CodenameOne_GLViewController instance];//self;
}

-(void)setProduction{}
-(void)onCreate{ //THIS METHOD GETS CALLED FIRST
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"onCreate()");
    self.isLoaded = NO;
    NSLog(@"a()");
    self.adController = [[ASInterstitialViewController alloc] viewControllerForPlacementID:@"1000741" withDelegate:self];
    NSLog(@"b()");
    self.adController.isPreload = YES;
    NSLog(@"c()");
    [self.adController loadAd];
    NSLog(@"d()");
    
    
 //[self showInterstitial];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad()");
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
    self.isLoaded = YES;
    [self.adController showFromViewController:self];
}
/// Ad loaded ///
- (void)interstitialViewControllerAdLoadedSuccessfully:(ASInterstitialViewController *)viewController {
    NSLog(@"Ad loaded");
    self.isLoaded = YES;
    [self.adController showFromViewController:self];
}
/// Ad Failed ///
- (void)interstitialViewControllerAdFailedToLoad:(ASInterstitialViewController*)viewController withError:(NSError*)error {
    NSLog(@"Ad Failed to load with error:%@", error);
}
/// Ad Clicked ///
- (void)interstitialViewControllerAdWasTouched:(ASInterstitialViewController *)viewController {
    NSLog(@"ad was touched");
}
/// Ad Dismissed ///
- (void)interstitialViewControllerDidDisappear:(ASInterstitialViewController *)viewController {
    self.adController = nil;
    NSLog(@"ad dismissed");
}

@end
