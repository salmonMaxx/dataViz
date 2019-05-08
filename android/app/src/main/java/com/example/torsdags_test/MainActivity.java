package com.example.torsdags_test;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.widget.ArrayAdapter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugins.GeneratedPluginRegistrant;



public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "kalle";
        @Override
        public void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        if (call.method.equals("getPermissions")){
                            //TODO make it so that the result.success returns one string at a time in some way.
                            // ALSO tidy up the code in methods, they are now shitty
                            HashMap<String, String> permissionList = getPermissions();
                            result.success(permissionList);
                        } else {
                            result.notImplemented();
                        }
                    }
                });
      }

      @SuppressLint("NewApi")
      public HashMap<String,String> getPermissions(){
          //make variables
          final Intent mainIntent = new Intent(Intent.ACTION_MAIN, null);
          final List pkgAppsList = getPackageManager().queryIntentActivities(mainIntent, 0); // gives a List<ResolveInfo>
          mainIntent.addCategory(Intent.CATEGORY_LAUNCHER);
          PackageInfo packageInfo;
          PackageManager thePackageManager = getPackageManager();
          HashMap<String, String> permissionNameMap = new HashMap<>();
          String joinedPermissions = "";

          //resolve every element in pkgAppsList
          for (Object obj : pkgAppsList) {
              ResolveInfo resolveInfo = (ResolveInfo) obj;
              thePackageManager = getPackageManager();
              try {
                  //resolve package info
                  packageInfo = thePackageManager.getPackageInfo(resolveInfo.activityInfo.packageName, PackageManager.GET_PERMISSIONS);
                  joinedPermissions = String.join(",", packageInfo.requestedPermissions);
                  permissionNameMap.put(resolveInfo.activityInfo.packageName, joinedPermissions);
              } catch (Exception e) { //PackageManager.NameNotFoundException e
                //   TODO Auto-generated catch block
                    e.printStackTrace();
              }
          }
          return permissionNameMap;
      }
}
