/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rsl.aerservlib;

/**
 *
 * @author USER
 */
public interface AerservAdsListener {
    
    public void advertPreloaded();
    public void advertLoaded();
    public void advertFailed();
    public void advertClicked();
    public void advertDismissed();

}
