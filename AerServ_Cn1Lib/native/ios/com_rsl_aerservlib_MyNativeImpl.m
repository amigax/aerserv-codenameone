#import "com_rsl_aerservlib_MyNativeImpl.h"

#import "AerServSDK.h"

#define kAlertTimeout 2.0f
#define kNameKey @"name"
#define kRewardAmountKey @"rewardAmount"

@interface com_rsl_aerservlib_MyNativeImpl ()<ASInterstitialViewControllerDelegate, ASAdViewDelegate>

@property (assign, nonatomic) IBOutlet UITextField *text_placement;// i made these assign to get a compile
@property (assign, nonatomic) IBOutlet UIButton *interstitial_button;
@property (assign, nonatomic) IBOutlet UIButton *banner_button;
@property (assign, nonatomic) IBOutlet UIButton *pause_button;
@property (assign, nonatomic) IBOutlet UIButton *play_button;
@property (assign, nonatomic) IBOutlet UIButton *show_button;
@property (assign, nonatomic) IBOutlet UISwitch *preload_switch;
@property (assign, nonatomic) IBOutlet UISwitch *keywords_switch;
@property (assign, nonatomic) IBOutlet UISwitch *location_switch;
@property (nonatomic, assign) BOOL load_banner;

@property (strong, nonatomic) ASInterstitialViewController* adController;
@property (strong, nonatomic) ASAdView *banner_view;

@property (nonatomic) BOOL isLoaded;

@property (nonatomic, assign) IBOutlet UILabel *versionLbl;//made this assign

@end




@implementation com_rsl_aerservlib_MyNativeImpl



-(void)setProduction{
}
-(void)onCreate{
  NSLog(@"onCreate()");

//ripped from main inside appdelegate.m
  // initialize aerservsdk for placement
    [AerServSDK initializeWithPlacments:@[
//                                          @"1002090", @"1003250", @"1007853", // AdColony
//                                          @"1002091", @"1007934", // VUNGLE
//                                          @"1005994", // CHARTBOOST
//                                          @"1005992", // APPLOVIN
//                                          @"300077", // TEST PLACEMENT
                                          ]];

//[self view];//force it to call viewdidload!??????????????
 [self view];
[self viewDidLayoutSubviews];
[self viewDidAppear:FALSE];

}
-(void)setDev{
}
-(void)onPause{
}
-(void)pauseBanner{
}
-(void)showBanner{
}
-(void)onDestroy{
}
-(void)onResume{
}
-(void)playBanner{
}
-(void)setStaging{
}
-(BOOL)isSupported{
    return YES;
}


/////pasted from their example and tweaked////




//warning I suck at objc so this is kind of cobbled together :)
//Gaz, these are the methods we call upon, from outside this lib
//////////////////////////////////////////
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

BOOL preload;
- (void)preloadInterstitial {
    NSLog(@"preloadInterstitial()");
    self.preload_switch.on = YES;

}

- (void)loadInterstitial {
    NSLog(@"loadInterstitial()");
    [self on_click_interstitial];

}
BOOL weWantItToShow;
- (void)showInterstitial {
    NSLog(@"showInterstitial()");
//[self on_click_show];///////////////////////////////
    weWantItToShow=TRUE;

}

//////////////////////////////////

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad()");
    /* Gaz, i dont want any UI stuff
     [self.interstitial_button addTarget:self action:@selector(on_click_interstitial) forControlEvents:UIControlEventTouchUpInside];
     [self.banner_button addTarget:self action:@selector(on_click_banner) forControlEvents:UIControlEventTouchUpInside];
     [self.pause_button addTarget:self action:@selector(on_click_pause) forControlEvents:UIControlEventTouchUpInside];
     [self.play_button addTarget:self action:@selector(on_click_play) forControlEvents:UIControlEventTouchUpInside];
     [self.show_button addTarget:self action:@selector(on_click_show) forControlEvents:UIControlEventTouchUpInside];
     [self.versionLbl setText:[ASFileManager readVersionFromBundle]];*/
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"viewDidAppear() animated? %d",animated);
    [super viewDidAppear:animated];
    self.show_button.enabled = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRotate) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    
    //test my methods///////////////////////////
    [self setPlc:@"1000741"];
    [self preloadInterstitial];
    [self loadInterstitial];
    [self showInterstitial];
    
    
    // NSLog(@"auto click");
    // [self on_click_interstitial];
    
    
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"viewDidDisappear()");
      [super viewDidDisappear:animated];
     [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    NSLog(@"didReceiveMemoryWarning()");
    //[super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)preloadReady {
    NSLog(@"preloadReady()");
    // [ASAlertManager showAlertWithMessage:@"Preload Ready" forTimeInt:2];
    
    //gaz now auto play
    if (weWantItToShow)
    {
        NSLog(@"auto show");
        [self on_click_show];
    }
    
}

#pragma mark - helpers

- (NSString *)vcStr:(NSDictionary *)dataObj {
    NSLog(@"vcStr()");
    return [NSString stringWithFormat:@"\nname: %@\namount: %@", ([dataObj objectForKey:kNameKey]) ? [dataObj objectForKey:kNameKey] : @"N/A", ([dataObj objectForKey:kRewardAmountKey]) ? [dataObj objectForKey:kRewardAmountKey] : @"N/A"];
}

- (void)didRotate {
    NSLog(@"didRotate()");
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if(UIInterfaceOrientationIsPortrait(orientation)) {
        self.versionLbl.hidden = NO;
    } else if(UIInterfaceOrientationIsLandscape(orientation)) {
        self.versionLbl.hidden = YES;
    }
}

#pragma mark - Interstitial Methods

- (void)on_click_interstitial {
    NSLog(@"on_click_interstitial()");
    self.banner_view = nil;
    self.isLoaded = NO;
    
    //self.text_placement.text = myPlc;
    NSLog(@"...The plc is %@", myPlc);
    //
    ///self.adController = [[ASInterstitialViewController alloc] viewControllerForPlacementID:self.text_placement.text withDelegate:self];
    self.adController = [[ASInterstitialViewController alloc] viewControllerForPlacementID:myPlc withDelegate:self];

    self.adController.isPreload = TRUE;///////self.preload_switch.on;
    //self.adController.showOutline = YES;
    if(self.preload_switch.on) {
        self.show_button.enabled = NO;
    }

    ////Gaz, make sure this is off?
    self.keywords_switch.on = FALSE;
    //
    self.adController.keyWords = (self.keywords_switch.on) ? @[@"keyword3", @"keyword4"] : nil;
    self.load_banner = false;
    
    //self.adController.timeoutInterval = 5;
    self.adController.locationServicesEnabled = FALSE;//////////self.location_switch.on;
    
    NSLog(@"now loading advert");
    [self.adController loadAd];
    
}

- (void)on_click_show {
    NSLog(@"on_click_show()");
    if (self.preload_switch.on && self.isLoaded) {
    //if (self.isLoaded) {
        
        [self.adController showFromViewController:self];
        [self.banner_view showPreloadedBanner];
    }
    else{
        NSLog(@"not loaded yet");
    }
}

- (void)interstitialViewControllerAdLoadedSuccessfully:(ASInterstitialViewController *)viewController {
    NSLog(@"Interstitial ad loaded");
    //    [ASAlertManager showAlertWithMessage:@"Interstitial ad loaded" forTimeInt:kAlertTimeout];
    self.isLoaded = YES;
    [self.adController showFromViewController:self];
}

- (void)interstitialViewControllerDidPreloadAd:(ASInterstitialViewController *)viewController {
    NSLog(@"Interstitial ad did preload");
    //    [ASAlertManager showAlertWithMessage:@"Interstitial ad did preload" forTimeInt:kAlertTimeout];
    self.isLoaded = YES;
    [self preloadReady];
    //  self.show_button.enabled = YES;
}


- (void)interstitialViewControllerAdFailedToLoad:(ASInterstitialViewController*)viewController withError:(NSError*)error {
    NSLog(@"Interstitial ad failed to load with error:%@", error.localizedDescription);
    //[ASAlertManager showAlertWithMessage:[NSString stringWithFormat:@"Interstitial ad failed to load with error: %@", error.localizedDescription] forTimeInt:kAlertTimeout];
}


- (void)interstitialViewControllerAdWasTouched:(ASInterstitialViewController *)viewController {
    NSLog(@"Interstitial ad was touched");
    //    [ASAlertManager showAlertWithMessage:@"Interstitial ad was touched" forTimeInt:kAlertTimeout];
}

- (void)interstitialViewControllerDidAppear:(ASInterstitialViewController *)viewController {
    NSLog(@"Interstitial ad did appear");
    //    [ASAlertManager showAlertWithMessage:@"Interstitial ad did appear" forTimeInt:kAlertTimeout];
}

- (void)interstitialViewControllerAdDidComplete:(ASInterstitialViewController *)viewController {
    NSLog(@"Interstitial ad did complete");
    //[ASAlertManager showAlertWithMessage:@"Interstitial ad did complete" forTimeInt:kAlertTimeout];
}

- (void)interstitialViewControllerDidDisappear:(ASInterstitialViewController *)viewController {
    NSLog(@"Interstitial ad did disappear");
    //    [ASAlertManager showAlertWithMessage:@"Interstitial ad did disappear" forTimeInt:kAlertTimeout];
    self.adController = nil;
    // self.show_button.enabled = NO;
}

- (void)interstitialViewControllerDidVirtualCurrencyLoad:(ASInterstitialViewController *)viewController vcData:(NSDictionary *)vcData {
    NSLog(@"Interstitial ad with virtual currency did load: %@", vcData);
    // [ASAlertManager showAlertWithMessage:[NSString stringWithFormat:@"Interstitial ad with virtual currency did load: %@", [self vcStr:vcData]] forTimeInt:kAlertTimeout];
}

- (void)interstitialViewControllerDidVirtualCurrencyReward:(ASInterstitialViewController *)viewController vcData:(NSDictionary *)vcData {
    NSLog(@"Interstitial ad with virtual currency did reward: %@", vcData);
    //[ASAlertManager showAlertWithMessage:[NSString stringWithFormat:@"Interstitial ad with virtual currency did reward: %@", [self vcStr:vcData]] forTimeInt:kAlertTimeout];
    
}

#pragma mark - Banner Methods

- (void) on_click_banner {
    NSLog(@"on_click_banner()");
    /*  self.adController = nil;
     if (self.banner_view != nil) {
     [self.banner_view cancel];
     [self.banner_view removeFromSuperview];
     self.banner_view = nil;
     }
     self.banner_view = [[ASAdView alloc] initWithPlacementID:self.text_placement.text size:ASMediumRectSize];
     self.banner_view.isPreload = self.preload_switch.on;
     if(self.preload_switch.on) {
     self.show_button.enabled = NO;
     }
     
     self.banner_view.sizeAdToFit = YES;
     //self.banner_view.timeoutInterval = 5.0;
     self.banner_view.locationServicesEnabled = self.location_switch.on;
     
     self.load_banner = true;
     self.banner_view.keyWords = (self.keywords_switch.on) ? @[@"keyword3", @"keyword4"] : nil;
     self.banner_view.delegate = self;
     [self.view addSubview:self.banner_view];
     [self.banner_view loadAd];*/
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{ [self.view endEditing:YES]; }

- (void)on_click_pause {
    NSLog(@"on_click_pause()");
    // if(self.banner_view != nil)
    //   [self.banner_view pause];
}

- (void)on_click_play {
    NSLog(@"on_click_play()");
    if(self.banner_view != nil)
        [self.banner_view play];
}

- (void)adSizedChanged:(ASAdView *)banner_view {
    NSLog(@"adSizedChanged()");
    [self viewDidLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    NSLog(@"viewDidLayoutSubviews()");
    [super viewDidLayoutSubviews];
    
    CGRect viewFrame = self.view.bounds;
    
    NSInteger height = 60;
    NSInteger width = CGRectGetWidth(viewFrame);
    
    self.banner_view.frame = CGRectMake(0,CGRectGetHeight(viewFrame) - height, width, height);
}


- (UIViewController *)viewControllerForPresentingModalView {
    return self;
}

- (void)adViewDidFailToLoadAd:(ASAdView *)adView withError:(NSError *)error {
    NSLog(@"Banner ad did fail to load with error: %@", error.localizedDescription);
    // [ASAlertManager showAlertWithMessage:[NSString stringWithFormat:@"Banner ad did fail to load with error: %@", error.localizedDescription] forTimeInt:kAlertTimeout];
    [self.banner_view removeFromSuperview];
    self.banner_view = nil;
}

- (void)adViewDidLoadAd:(ASAdView *)adView {
    NSLog(@"Banner ad did load");
    //  [ASAlertManager showAlertWithMessage:@"Banner ad did load" forTimeInt:kAlertTimeout];
}

- (void)adViewDidPreloadAd:(ASAdView *)adView {
    NSLog(@"Banner ad did preload");
    //    [ASAlertManager showAlertWithMessage:@"Banner ad did preload" forTimeInt:kAlertTimeout];
    self.isLoaded = YES;
    [self preloadReady];
    //  self.show_button.enabled = YES;
}

- (void)adViewDidVirtualCurrencyLoad:(ASAdView *)adView vcData:(NSDictionary *)vcData {
    NSLog(@"Banner ad with virtual currency did load: %@", vcData);
    //[ASAlertManager showAlertWithMessage:[NSString stringWithFormat:@"Banner ad with virtual currency did load: %@", [self vcStr:vcData]] forTimeInt:kAlertTimeout];
}

- (void)adViewDidVirtualCurrencyReward:(ASAdView *)adView vcData:(NSDictionary *)vcData {
    NSLog(@"Banner ad with virtual currency did reward: %@", vcData);
    // [ASAlertManager showAlertWithMessage:[NSString stringWithFormat:@"Banner ad with virtual currency did reward: %@", [self vcStr:vcData]] forTimeInt:kAlertTimeout];
}

- (void)adWasClicked:(ASAdView *)adView {
    NSLog(@"Banner ad was clicked");
    //[ASAlertManager showAlertWithMessage:@"Banner ad with clicked" forTimeInt:kAlertTimeout];
}

- (void)adViewDidCompletePlayingWithVastAd:(ASAdView *)adView {
    NSLog(@"Banner ad did complete playing");
    //  [ASAlertManager showAlertWithMessage:@"Banner ad did complete playing" forTimeInt:kAlertTimeout];
    [self.banner_view removeFromSuperview];
    self.banner_view = nil;
    // self.show_button.enabled = NO;
}


@end
