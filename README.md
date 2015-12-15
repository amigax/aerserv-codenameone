# aerserv-codenameone

Library extension of AerServ (www.aerserv.com) for the Codename One platform (http://www.codenameone.com).

This library supports AerServ interstitial Ads (Fullscreen video Ads) by supporting AerServ's core ones (podia, Spot exchange, Millenia, Inmobi, Tapit) as well as additional ones I have added the jars for Vungle, AdColony, you can add more as you please.

This library is implemented for Android an iOS (coming soon). Feel free to fork and fix :-)

Developed by Gareth Murfin (www.garethmurfin.co.uk) - Codename One and Android Freelance developer.

#Usage

##Initialise 
...
//call in intiVars()
MyNative my = (MyNative) NativeLookup.create(MyNative.class);
if (my!=null && my.isSupported())
{           
    my.onResume_(); //I think we need this, and maybe others for onPause etc..
}
...
...
##Load advert
my.setPlc("1000741"); // you must set your plc before you try to show an ad, this is the test plc
my.loadInterstitial();
...
...
##Preload advert
my.setPlc("1000741"); // you must set your plc before you try to show an ad, this is the test plc
my.preloadInterstitial();
...
...
##Show advert
my.setPlc("1000741"); // you must set your plc before you try to show an ad, this is the test plc
my.showInterstitial();
