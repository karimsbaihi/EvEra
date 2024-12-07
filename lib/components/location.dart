import 'package:location/location.dart'  as loc;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';


Future<List<String>> getCurrentLocation() async {
  List<String> location=[];

  // Check if location services are enabled
  var serviceEnabled = await loc.Location().serviceEnabled();
  if (!serviceEnabled) {
    // Request to enable the location service
    serviceEnabled = await loc.Location().requestService();
    if (!serviceEnabled) {
        location.add( "Location services are disabled.");
      return location;
    }
  }

  // Check for permissions
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      location.add("Location permissions are denied.");
      return location;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    location.add("Location permissions are permanently denied.");

    return location;
  }


  // Request location permission
  var permissionStatus = await Permission.location.request();

  if (permissionStatus.isDenied) {

      location.add( "Location permission denied.");

  } else if (permissionStatus.isPermanentlyDenied) {
    // Open app settings to allow the user to grant permission
    // AndroidSettings();
    await openAppSettings();

  }

  // Get the current position
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  // Convert latitude and longitude to address
  List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
  Placemark place = placemarks[0];


  location.add(place.country!);
  location.add(place.administrativeArea!.replaceAll('Wilaya de','').replaceAll("Wilaya d'",'').replaceAll(' Province',''));

  return location;
}