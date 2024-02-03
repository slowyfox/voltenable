package com.voltenable.shelltool;

import android.os.PersistableBundle;
import android.os.IBinder;
import android.os.ServiceManager;
import android.telephony.SubscriptionManager;
import com.android.internal.telephony.ICarrierConfigLoader;

public class Main {
  public static void main(String[] args) {
    final int subId = SubscriptionManager.getDefaultVoiceSubscriptionId();
    if (subId == SubscriptionManager.INVALID_SUBSCRIPTION_ID) {
      System.out.println("Failed to get SubId");
      System.exit(1);
    }
    System.out.println("SubId=" + subId);
    
    PersistableBundle override = new PersistableBundle();
    /* KEY_CARRIER_VOLTE_AVAILABLE_BOOL in android.telephony.CarrierConfigManager */
    override.putBoolean("carrier_volte_available_bool", true);
    
    try {
      IBinder binder = ServiceManager.getService("carrier_config");
      ICarrierConfigLoader configLoader = ICarrierConfigLoader.Stub.asInterface(binder);
      configLoader.overrideConfig(subId, override, true);
    } catch (Throwable t) {
      t.printStackTrace();
    }
    
    System.out.println("OK");
  }
}
