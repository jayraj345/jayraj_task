import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDialog extends Dialog {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
            ),
          ),
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(10),
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

loadingDialog() {
  Get.dialog(
    WillPopScope(
      onWillPop: () async => false,
      child: const LoadingDialog(),
    ),
    barrierDismissible: false,
  );
}
