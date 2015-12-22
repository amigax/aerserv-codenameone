#import <Foundation/Foundation.h>
#import "CodenameOne_GLViewController.h"
#import "AerServSDK.h"

@interface com_rsl_aerservlib_MyNativeImpl : CodenameOne_GLViewController   {}
@property (nonatomic, assign) ASInterstitialViewController *adController;

-(void)setProduction;
-(void)onCreate;
-(void)setDev;
-(void)showInterstitial;
-(void)onPause;
-(void)loadInterstitial;
-(NSString*)getPlc;
-(void) setPlc:(NSString*) plc;
-(void)pauseBanner;
-(void)showBanner;
-(void)onDestroy;
-(void)onResume;
-(void)playBanner;
-(void)setStaging;
-(void)preloadInterstitial;
-(BOOL)isSupported;
@end