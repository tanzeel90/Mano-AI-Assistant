import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mano_ai/widgets/custom_loading.dart';

class MyDialog {
//info

  static void info(String msg) {
    Get.snackbar('info', msg,
        backgroundColor: Colors.blue.withOpacity(.7), colorText: Colors.white);
  }

//success
  static void success(String msg) {
    Get.snackbar('success', msg,
        backgroundColor: Colors.green.withOpacity(.7), colorText: Colors.white);
  }

//error
  static void error(String msg) {
    Get.snackbar('error', msg,
        backgroundColor: Colors.red.withOpacity(.7), colorText: Colors.white);
  }

  //loading
  static void showLoadingDialog() {
    Get.dialog(const Center(child: CustomLoading()));
  }
}
