import 'package:shake/shake.dart';
import 'package:app_to_foreground/app_to_foreground.dart';
class ShakeService{
  late ShakeDetector detector;
  initializeShake(context){detector = ShakeDetector.waitForStart(
      onPhoneShake: () {
      
      AppToForeground.appToForeground();

      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 1000,
      shakeCountResetTime: 1000,
      shakeThresholdGravity: 1.5,
    );}

    shakeDetectStart(){
      detector.startListening();
    }

    
}