/*
 * Copyright (c) 2022 NetEase, Inc. All rights reserved.
 * Use of this source code is governed by a MIT license that can be
 * found in the LICENSE file.
 */

package com.gcpay.wallet

import android.app.Application
import com.huawei.hms.support.common.ActivityMgr

class FlutterIMApplication : Application() {

    override fun onCreate() {
        super.onCreate()
        // huawei push
        ActivityMgr.INST.init(this)
    }
}
