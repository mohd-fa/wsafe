import 'package:flutter_background/flutter_background.dart';

class BackgroundServices{

void initializeBackground() async{
    const androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: "flutter_background example app",
    notificationText: "Background notification for keeping the example app running in the background",
    notificationImportance: AndroidNotificationImportance.Default,
    notificationIcon: AndroidResource(name: 'background_icon', defType: 'drawable'), // Default is ic_launcher from folder mipmap
    );
    await FlutterBackground.initialize(androidConfig: androidConfig);
  }

Future<bool> get perm async => await FlutterBackground.hasPermissions;

void enableBackground() async{
bool success = await FlutterBackground.enableBackgroundExecution();}
void disableBackground() async{
bool success = await FlutterBackground.disableBackgroundExecution();}
}
