# aerserv-codenameone

Library extension of AerServ (www.aerserv.com) for the Codename One platform (http://www.codenameone.com).

This library supports AerServ interstitial Ads (Fullscreen video Ads) by supporting AerServ's core ones (Vpodia, Spot exchange, Millenia, Inmobi, Tapit) as well as additional ones I have added the jars for (Vungle, AdColony) you can add more as you please.

This library is implemented for Android an iOS (coming soon). Please note this library is still experimental it could use some refactoring (like MyNative ;)) as well as banner ad support, feel free to fork and fix :-)

Developed by Gareth Murfin (www.garethmurfin.co.uk) - Codename One and Android Freelance developer.

Also note that this lib contains a newer Vungle lib (vungle-publisher-adaptive-id-3.3.3.1.jar) for Android than the one shipped with the AerServ SDK in order to get around a bug where some classes are not found at runtime using the old one they ship. 

There is also a sample app which uses this lib available here: (https://github.com/amiga/aerserv-codenameone-testbed). Please note you can use PLC 10000741 to test if the lib is working, and also specifically to test Vungle you can use 1002823 on Android or 1002091 on iOS. You will need to set up an AerServ account and add some ad sources to get your own PLC. Also note you need to set the PLC from AerServ after intialising.

#Usage

##Initialise 

```
//call in initVars()
MyNative my = (MyNative) NativeLookup.create(MyNative.class);
if (my!=null && my.isSupported())
{           
    my.onResume_(); //I think we need this, and maybe others for onPause etc..
    my.setPlc("1000741"); // set your PLC before showing an ad, this is the test PLC which should work too
}
```

##Load advert
```
my.loadInterstitial();
```


##Preload advert
```
my.preloadInterstitial();
```


##Show advert
```
my.showInterstitial();
```