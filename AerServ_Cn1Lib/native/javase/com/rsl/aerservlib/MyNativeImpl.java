package com.rsl.aerservlib;

public class MyNativeImpl implements com.rsl.aerservlib.MyNative{
    
    @Override
    public void setProduction() {
        _("isSupported");
    }
    
    @Override
    public void setPlc(String plc_) {
        _("isSupported");
    }
    @Override
    public void onCreate() {
        _("isSupported");
    }
    @Override
    public void setDev() {
        _("isSupported");
    }
    @Override
    public void showInterstitial() {
        _("isSupported");
    }
    @Override
    public void onPause() {
        _("isSupported");
    }
    @Override
    public void loadInterstitial() {
        _("isSupported");
    }
    @Override
    public String getPlc() {
        _("isSupported");
        return null;
    }
    @Override
    public void pauseBanner() {
        _("isSupported");
    }
    @Override
    public void showBanner() {
        _("isSupported");
    }
    @Override
    public void onDestroy() {
        _("isSupported");
    }
    @Override
    public void onResume() {
        _("isSupported");
    }
    @Override
    public void playBanner() {
        _("isSupported");
    }
    @Override
    public void setStaging() {
        _("isSupported");
    }
    @Override
    public void preloadInterstitial() {
        _("isSupported");
    }
    @Override
    public boolean isSupported() {
        _("isSupported");
        return true;
    }
    
    private void _(String s)
    {
        System.out.println("MyNativeImpl#########"+s);
    }

   

}
