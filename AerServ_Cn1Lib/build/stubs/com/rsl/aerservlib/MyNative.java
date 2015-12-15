package com.rsl.aerservlib;


/**
 * 
 *  @author USER
 */
public interface MyNative extends com.codename1.system.NativeInterface {

	public void onCreate();

	public void onResume_();

	public void onPause();

	public void onDestroy();

	public void preloadInterstitial();

	public void showInterstitial();

	public void pauseBanner();

	public void playBanner();

	public void setDev();

	public void setStaging();

	public void setProduction();

	public void loadInterstitial();

	public void showBanner();

	public void setPlc(String plc_);

	public String getPlc();
}
