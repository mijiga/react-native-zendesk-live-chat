package com.zendesklivechat

import android.content.Intent
import android.util.Log
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import zendesk.android.Zendesk
import zendesk.messaging.android.DefaultMessagingFactory

class ZendeskLiveChatModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

  @ReactMethod
  fun initZendesk(channelKey: String) {
    Zendesk.initialize(
      context = reactApplicationContext,
      channelKey = channelKey,
      successCallback = { _ ->
        Log.i("IntegrationApplication", "Initialization successful")
      },
      failureCallback = { error ->
        Log.e("IntegrationApplication", "Initialization failed", error)
      },
      messagingFactory = DefaultMessagingFactory()
    )
  }

  @ReactMethod
  fun openZendeskChat() {
    Zendesk.instance.messaging.showMessaging(reactApplicationContext, Intent.FLAG_ACTIVITY_NEW_TASK)
  }

  companion object {
    const val NAME = "ZendeskLiveChat"
  }
}
