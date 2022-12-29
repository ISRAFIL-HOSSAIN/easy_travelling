// import 'package:easy_travel/model/Route_model.dart';
// import 'package:easy_travel/service/api_service.dart';
// import 'package:get/get.dart';

// class RouteMapController extends GetxController {
//   var isLoading = true.obs;
//   final routeList = <RouteModel>[].obs;

//   @override
//   void onInit() {
//     fetchdata();
//     super.onInit();
//   }

//   void fetchdata() async {
//     try {
//       isLoading(true);
//       // var routedata = await ApiService.fetchRouteData();
//       // routeList.assignAll(routedata);
//       var routeResponse = await ApiService.fetchRouteData();
//       print("Data is :");
//       print(routeResponse);
//       routeList.assignAll(routeResponse);
//     } catch (e) {
//       print(e);
//     } finally {
//       isLoading(false);
//     }
//   }

//   fetch() async {
//     var routeResponse = await ApiService.fetchRouteData();
//     print(routeResponse);
//     routeList.addAll(routeResponse);
//   }
// }
