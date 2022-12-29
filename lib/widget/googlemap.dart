import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MapUtils {
  MapUtils._();
//   static Future<void> openMap(double latitude, double longitude) async {
//     String googleUrl =
//         'https://www.google.com/maps/search/?api=1&query=$latitude, $longitude';
//     if (await canLaunch(googleUrl)) {
//       await launch(googleUrl, forceWebView: true,);
//     }
//     else {
//       throw 'Could not open the map ';
//     }
//   }
// }
  static Future<void> openMap(double latitude, double longitude) async {
    String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    await launchUrlString(googleMapUrl, mode: LaunchMode.externalApplication);
  }
}
