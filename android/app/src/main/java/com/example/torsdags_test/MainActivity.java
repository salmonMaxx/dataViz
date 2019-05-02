package com.example.torsdags_test;

import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Bundle;

import java.util.List;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugins.GeneratedPluginRegistrant;



public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "samples.flutter.io/permissions";
        @Override
        public void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                  if (call.method.equals("getPermissions")){
                      String[] permissionList = getPermissions();
                      result.success(permissionList);
                  } else {
                    result.notImplemented();
                  }
              }
            }
        );
      }
      public String[] getPermissions(){
          final Intent mainIntent = new Intent(Intent.ACTION_MAIN, null);
          mainIntent.addCategory(Intent.CATEGORY_LAUNCHER);
          final List pkgAppsList = getPackageManager().queryIntentActivities(mainIntent, 0);
          PackageInfo packageInfo = null; 
          for (Object obj : pkgAppsList) {
                 ResolveInfo resolveInfo = (ResolveInfo) obj;

                try {
                  packageInfo = getPackageManager().getPackageInfo(resolveInfo.activityInfo.packageName, PackageManager.GET_PERMISSIONS);
                } catch (PackageManager.NameNotFoundException e) {
                  // TODO Auto-generated catch block
                  e.printStackTrace();
                }
            }
          return packageInfo.requestedPermissions;
      }
}
