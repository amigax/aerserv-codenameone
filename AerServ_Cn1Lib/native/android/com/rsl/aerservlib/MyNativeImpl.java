package com.rsl.aerservlib;

//native android implementation for AerServ library for Codename One
//by Gareth Murfin www.garethmurfin.co.uk

//import com.vungle.publisher.*;
import com.vungle.publisher.FullScreenAdActivity;//simply to prove it compiles, since this is not being found at run time, rmeove me when working

import com.codename1.impl.android.AndroidNativeUtil;
import com.aerserv.sdk.*;
import java.util.*;
import com.aerserv.sdk.utils.UrlBuilder;
import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

public class MyNativeImpl {
    
    //TEST THAT WE HAVE THIS TO COMPILE
public static com.vungle.publisher.FullScreenAdActivity xxx;    
//
       
    private static final String TAG = "AS";
    private Context selfContext;
    private AerServBanner banner;
    private AerServInterstitial interstitial;
    private static final boolean staging = true;
    
    private List<String> keywords = Arrays.asList("keyword1", "keyword2");
    private AerServEventListener listener = new AerServEventListener(){
        @Override
        public void onAerServEvent(final AerServEvent event, final List<Object> args)
        {
            ((Activity)selfContext).runOnUiThread(new Runnable() {
            @Override
            public void run() {
                String msg = null;
                switch (event) {
                    case AD_FAILED:
                    msg = "Ad Failed with message: " + args.get(0).toString();
                break;
                case VC_READY:
                    AerServVirtualCurrency vcObject = (AerServVirtualCurrency) args.get(0);
                    msg = "Virtual Currency PLC has loaded: " + vcObject.getName() + ", " + vcObject.getAmount().toString();
                break;
                case VC_REWARDED:
                    AerServVirtualCurrency vcObject2 = (AerServVirtualCurrency) args.get(0);
                    msg = "Virtual Currency PLC has rewarded: " + vcObject2.getName() + ", " + vcObject2.getAmount().toString();
                break;
                default:
                    msg = event.toString() + " event fired with args: " + args.toString(); 
                }
             Toast.makeText(selfContext, msg, Toast.LENGTH_SHORT).show();
             Log.d(TAG, msg);
            }
          });
        }
    };
   
    public void onCreate() 
    {
    }  

    public void showInterstitial() {
        if (interstitial != null) interstitial.show();
    }

    public void onPause() {
    }       

    public void loadInterstitial() 
    {
        _("loadInterstitial()");
        selfContext=AndroidNativeUtil.getActivity();
        AerServConfig config = new AerServConfig(selfContext, getPlc()).setKeywords(keywords).setEventListener(listener).setDebug(true).setVerbose(true);
        interstitial = new AerServInterstitial(config);
	interstitial.show();
    }

    String plc="";
    public void setPlc(String plc_)
    {
        plc=plc_;
    }
    public String getPlc() {
        _("returning your plc:"+plc);
        if (plc.length()==0)
        {
            _("Warning! plc was empty did you call setPlc() ?");
        }
        return plc;
    }

    public void pauseBanner() {
        if (banner != null) banner.pause();
    }

    public void showBanner() {
         selfContext=AndroidNativeUtil.getActivity();
        _("GAZ REMOVED THIS FOR NOW.");        
        //  final AerServConfig config = new AerServConfig(selfContext, getPlc()).setKeywords(keywords).setEventListener(listener).setDebug(true).setRefreshInterval(60).setVerbose(true);
        //  banner = (AerServBanner) findViewById(R.id.banner);
	//  banner.configure(config).show();
    }

    public void onDestroy() {
         if(banner != null){
            banner.kill();
         }
    }

    //NOT SURE HOW TO HANDLE LIFECYCLE METHODS YET, TO DO, LEARN ;)
    public void onResume_() {
        //  @Override
        //protected void onResume() {
      //  super.onResume();
        if(banner != null){
            banner.play();
        }
        
        //GAZ
        //EditText plcEditText = (EditText)findViewById(R.id.plcET);
        //plcEditText.setText("1007855");//1000741");//");
    //}
    }

    public void playBanner() {
        if (banner != null) banner.play();
    }

    public void setDev(){//View view) {
        AerServConfig.setBaseUrlTo("http://dev.ads.aerserv.com/as/sdk/v1/");
        Toast.makeText(selfContext, "Set to dev: dev.ads.aerserv.com", Toast.LENGTH_SHORT).show();
    }

    public void setStaging(){//View view) {
        AerServConfig.setToStagingUrl();
        Toast.makeText(selfContext, "Set to staging: staging.ads.aerserv.com", Toast.LENGTH_SHORT).show();
    }

    public void setProduction(){//View view) {
        AerServConfig.setToProductionUrl();
        Toast.makeText(selfContext, "Set to prod: ads.aerserv.com", Toast.LENGTH_SHORT).show();
    }

    public void preloadInterstitial() {
        selfContext=AndroidNativeUtil.getActivity();
        final AerServConfig config = new AerServConfig(selfContext, getPlc()).setKeywords(keywords).setEventListener(listener).setDebug(true).setPreload(true);
	interstitial = new AerServInterstitial(config);
    }

    public boolean isSupported() {
        _("Yes this lib is supported on Android!");
        return true;
    }
        
    //a wrapper so we dont have to type this every time
    private void _(String s)
    {        
        Log.d("MyApp", "MyNativeImpl" + "#######" + s);
    }
}
