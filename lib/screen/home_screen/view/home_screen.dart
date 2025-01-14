import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:store_locator/screen/home_screen/controller/home_screen_controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:store_locator/screen/home_screen/model/store_response_model.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stores'),
        forceMaterialTransparency: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      child: FlutterMap(
                        mapController: controller.mapController,
                        options: MapOptions(
                          initialCenter: LatLng(16.69, 74.23),
                          initialZoom: 13,
                          cameraConstraint: CameraConstraint.contain(
                            bounds: LatLngBounds(
                              const LatLng(-90, -180),
                              const LatLng(90, 180),
                            ),
                          ),
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          ),
                          Obx(() {
                            StoreDetailModel? selectedStore = controller.selectedStore.value;
                            return MarkerLayer(
                                markers: controller.storeList
                                    .map((marker) {
                                  bool isSelected = selectedStore != null && selectedStore.code == marker.code;
                                      return Marker(
                                        height:50,
                                        width: 50,
                                        point: LatLng(
                                            marker.latitude, marker.longitude),
                                        child: Icon(
                                          Icons.location_on_outlined,
                                          color: isSelected ? Colors.pink : Colors.blue,
                                        ));})
                                    .toList());
                          })
                        ],
                      ),
                    ),
                  ),
                  Obx(() {
                    StoreDetailModel? selectedStore =
                        controller.selectedStore.value;

                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.storeList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final store = controller.storeList[index];

                          return _storeDetailCard(
                            store,
                            selectedStore,
                            onTap: () {
                              controller.selectedStore.value = store;
                              controller.mapController.move(
                                  LatLng(store.latitude, store.longitude), 14);
                            },
                          );
                        },
                      ),
                    );
                  })
                ],
              ),
      ),
    );
  }
}

Widget _storeDetailCard(
  StoreDetailModel store,
  StoreDetailModel? selectedStore, {
  required Function() onTap,
}) {
  double height = Get.height;
  double width = Get.width;
  bool isSelected = selectedStore != null && selectedStore.code == store.code;
  return Card(
    color: isSelected ? Colors.orange.shade50 : null,
    clipBehavior: Clip.hardEdge,
    child: InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                color: isSelected ? Colors.deepOrange : Colors.transparent)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.storefront),
                SizedBox(
                  width: width * 0.02,
                ),
                Text(
                  'Kolhapur',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                Spacer(),
                Text('${store.distance}km Away',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15))
              ],
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Text(
              store.storeAddress,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            SizedBox(
              height: height * 0.003,
            ),
            Text(
              'Today, ${store.dayOfWeek} ${store.startTime}-${store.endTime}',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            )
          ],
        ),
      ),
    ),
  );
}
