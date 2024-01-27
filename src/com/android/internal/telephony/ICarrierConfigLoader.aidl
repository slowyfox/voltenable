package com.android.internal.telephony;
import android.os.PersistableBundle;
/**
 * Interface used to interact with the CarrierConfigLoader
 */
interface ICarrierConfigLoader {
    void overrideConfig(int subId, in PersistableBundle overrides, boolean persistent);
}
