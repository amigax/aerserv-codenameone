/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rsl.aerservlib;

import com.codename1.ui.Display;

/**
 *
 * @author USER
 */
public class Callback {
    private static AerservAdsListener l;
    
    public static void advertClicked(){
        if(l != null){
            Display.getInstance().callSerially(new Runnable(){

                public void run() {
                    l.advertClicked();
                    _("advertClicked");
                }
            });
        }
    }

    public static void advertDismissed(){
        if(l != null){
            Display.getInstance().callSerially(new Runnable(){

                public void run() {
                    l.advertDismissed();
                    _("advertDismissed");
                }
            });
        }    
    }

    public static void advertLoaded(){
        if(l != null){
            Display.getInstance().callSerially(new Runnable(){

                public void run() {
                    l.advertLoaded();
                    _("advertLoaded");
                }
            });
        }        
    }

    public static void advertFailed(){
        if(l != null){
            Display.getInstance().callSerially(new Runnable(){

                public void run() {
                    l.advertFailed();
                    _("advertFailed");
                }
            });
        }            
    }

    public static void advertPreloaded(){
        if(l != null){
            Display.getInstance().callSerially(new Runnable(){

                public void run() {
                    l.advertPreloaded();
                    _("advertPreloaded");
                }
            });
        }                
    }

    public static void setListener(AerservAdsListener listener){
        l = listener;
        _("setListener");
    }
    
    
    //System out wrappers//    
    public static final void _(String s)
    {
        System.out.println("###!Callback:"+s);
    }
}
