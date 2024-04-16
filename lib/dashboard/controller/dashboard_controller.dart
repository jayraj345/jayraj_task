import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task_test/dashboard/model/image_model.dart';
import 'package:task_test/services/rest_services.dart';
import 'package:task_test/services/service_configuration.dart';

class DashboardController extends GetxController {
  RxList<ImageModel> imageModel = <ImageModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getImagesList();
    super.onInit();
  }

  getImagesList() async {
    try {
      isLoading.value = false;
      var response = await RestServices().getData(
          "${ServiceConfiguration.baseURL}?key=${ServiceConfiguration.Key}&q=yellow+flowers&image_type=photo&pretty=true");
      isLoading.value = true;
      isLoading.refresh();
      if (response.statusCode == HttpStatus.ok) {
        imageModel.value = [];
        for (var element in response.body["hits"]) {
          imageModel.add(ImageModel.fromJson(element));
        }
        imageModel.refresh();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
