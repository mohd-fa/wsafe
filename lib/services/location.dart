import 'package:location/location.dart';

class LocationService {
  final location = Location();
  getLocationService() async {
    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    return serviceEnabled;
  }

  getLocationPermition() async {
    var permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted == PermissionStatus.denied) {
        return false;
      }
      return true;
    }
    return true;
  }

  Future<LocationData> getUploadLoc() {
    getLocationPermition();
    getLocationService();
    return location.getLocation();
  }
}
