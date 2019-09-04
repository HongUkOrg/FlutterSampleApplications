package com.igaworks.flutter_adbrix_remaster;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import com.igaworks.v2.core.AdBrixRm;
import com.igaworks.v2.core.application.AbxActivityHelper;
import com.igaworks.v2.core.application.AbxActivityLifecycleCallbacks;
import com.igaworks.v2.core.application.AbxApplication;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterAdbrixRemasterPlugin */
public class FlutterAdbrixRemasterPlugin implements MethodCallHandler {
  /** Plugin registration. */

  private static Context context;
  private static Activity activity;

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_adbrix_remaster");
    channel.setMethodCallHandler(new FlutterAdbrixRemasterPlugin());
    context = registrar.context();
    activity = registrar.activity();
//    activity.getApplication().registerActivityLifecycleCallbacks(new AbxActivityLifecycleCallbacks());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("startAdbrixSDK")) {
      AbxActivityHelper.initializeSdk(context,"tiOfuTDHk0icyqiS9UAgiQ","d8B12SfubUmBwIGqjDWw1Q");
      AbxActivityHelper.onResume(activity);
      activity.getApplication().registerActivityLifecycleCallbacks(new AbxActivityLifecycleCallbacks());
      result.success("success!!");
    }
    else if (call.method.equals("onPause")) {
      Log.d("HONG", "on pause");
      AbxActivityHelper.onPause(activity);
      result.success("");
    }
    else if (call.method.equals("onResume")) {
      Log.d("HONG", "on Resume");
      AbxActivityHelper.onResume(activity);
      result.success("");
    }
    else if(call.method.equals("login")){
      Log.d("HONG", "Login!");
      AdBrixRm.login((String)call.argument("userId"));
    }
    else {
      result.notImplemented();
    }



  }
}
