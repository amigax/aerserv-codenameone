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
    
     public void onCreate();//Bundle savedInstanceState);
     public void onResume();
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
