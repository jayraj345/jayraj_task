import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_test/dashboard/controller/dashboard_controller.dart';
import 'package:task_test/dashboard/widget/responsive_grid.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Photos"),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? ResponsiveGrid(
                imageUrls: controller.imageModel,
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
      }),
    );
  }
}
