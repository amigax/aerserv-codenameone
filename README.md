# aerserv-codenameone

Library extension of AerServ (www.aerserv.com) for the Codename One platform (http://www.codenameone.com).

This library supports AerServ interstitial Ads (Fullscreen video Ads) by supporting AerServ's core ones (Vpodia, Spot exchange, Millenia, Inmobi, Tapit) as well as additional ones I have added the jars for (Vungle, AdColony) you can add more as you please.

This library is implemented for Android an iOS (coming soon). This lib is experimental still and could use some refactoring (like MyNative ;)) as well as banner ad support, feel free to fork and fix :-)

Developed by Gareth Murfin (www.garethmurfin.co.uk) - Codename One and Android Freelance developer.

Also note that this lib contains a newer Vungle lib (vungle-publisher-adaptive-id-3.3.3.1.jar) for Android than the one shipped with the AerServ SDK in order to get around a bug where some classes are not found at runtime using the old one they ship. 

There is also a sample app which uses this lib available here: xxxx.com. Please note you can use PLC 10000741 to test if the lib is working, and also specifically to test Vungle you can use 1002823 on Android or 1002091 on iOS. You will need to set up an AerServ account and ad some ad sources to get your own PLC. 

#Usage

##Initialise 

```
//call in intiVars()
MyNative my = (MyNative) NativeLookup.create(MyNative.class);
if (my!=null && my.isSupported())
{           
    my.onResume_(); //I think we need this, and maybe others for onPause etc..
}
```

##Load advert
```
my.setPlc("1000741"); // you must set your plc before you try to show an ad, this is the test plc
my.loadInterstitial();
```


##Preload advert
```
my.setPlc("1000741"); // you must set your plc before you try to show an ad, this is the test plc
my.preloadInterstitial();
```


##Show advert
```
my.setPlc("1000741"); // you must set your plc before you try to show an ad, this is the test plc
my.showInterstitial();
```