#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>




@interface com_rsl_aerservlib_MyNativeImpl : UIViewController //{
//}

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
