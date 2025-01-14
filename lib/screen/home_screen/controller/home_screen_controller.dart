import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:store_locator/screen/home_screen/model/store_response_model.dart';


final dio = Dio();

class HomeScreenController extends GetxController {

  final mapController = MapController();

  final storeList = <StoreDetailModel>[].obs;
  final isLoading = true.obs;

  final selectedStore = Rx<StoreDetailModel?>(null);

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getStoreData();
    isLoading.value = false;
  }

  Future<void> getStoreData() async {
    String url = 'https://atomicbrain.neosao.online/nearest-store';
    try{
      final response = await dio.get(url);
      if(response.statusCode==200){
        final result = StoreDetailResponseModel.fromJson(response.data);
        storeList.value = result.data;
      }
    }catch(e){
      print(e);
    }
  }


}