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
    private static final String CHANNEL = "dataViz/OtherApps/channel";
        @Override
        public void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                  if (call.method.equals("getPermissions")){
                      result.success(_getPermissionList());
                  } else {
                    result.notImplemented();
                  }
              }
            }
        );
      }

      public String[] _getPermissionList(){
            String[] permissionList;
            permissionList = _getPermissions();
            return permissionList;
      }

      public String[] _getPermissions(){
          final Intent mainIntent = new Intent(Intent.ACTION_MAIN, null);
          mainIntent.addCategory(Intent.CATEGORY_LAUNCHER);
          final List pkgAppsList = getPackageManager().queryIntentActivities(mainIntent, 0);
          PackageInfo packageInfo = null;
                                // System.out.println("size of pkgAppsList: " + pkgAppsList.size());
          int indexx = 0;
          for (Object obj : pkgAppsList) {
              System.out.println("obj: "+obj);
              ResolveInfo resolveInfo = (ResolveInfo) obj;
              indexx++;
              System.out.println("index: " + indexx);
              try {
                  //System.out.println("===========================================\ntrying ln 50 in getPermission\n===========================================\n");
                  packageInfo = getPackageManager().getPackageInfo(resolveInfo.activityInfo.packageName, PackageManager.GET_PERMISSIONS);

                  System.out.println(pkgAppsList);
                  //System.out.println("packageInfo: " +packageInfo);
                  //System.out.println("\nline 54\n");
              } catch (Exception e) { //PackageManager.NameNotFoundException e
                  // TODO Auto-generated catch block
                    System.out.println("::::::Name not found exception::::::\n");
                    e.printStackTrace();
              }
          }
          return packageInfo.requestedPermissions;
      }
}
