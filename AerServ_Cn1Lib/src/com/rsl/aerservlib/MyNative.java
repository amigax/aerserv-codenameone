/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rsl.aerservlib;

import com.codename1.system.NativeInterface;

/**
 *
 * @author USER
 */
public interface MyNative extends NativeInterface{
    
   /*   public void intialise(String adType);
    
    public void showInterstitialVideo();
    
    public void showInterstitialImage();
    
    public Object getBanner();//erm? cant return banner how do i do this?
    
    //lifecycle stuff, added because i think you need them, doesnt seem to work until onresuem is called? VERIFY THAT
    public void onResume_();
    public void onPause_();
    public void onDestroy_();*/
    
    
    
   
    
    
    
     public void onCreate();//Bundle savedInstanceState);
     public void onResume_();
     public void onPause();
     public void onDestroy();
     public void preloadInterstitial();//View view);
     public void showInterstitial();//View view) ;
     public void pauseBanner();//View view) ;
     public void playBanner();//View view) ;
     public void setDev();//View view) ;
     public void setStaging();//View view); 
     public void setProduction();//View view); 
     public void loadInterstitial();//View view);
     public void showBanner();//View view) ;
     
     public void setPlc(String plc_);
   
     public String getPlc() ;

}
