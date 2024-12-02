//import 'dart:developer';
//import 'dart:io';

import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
//import 'package:gallery_saver_updated/gallery_saver.dart';
import 'package:get/get.dart';
//import 'package:http/http.dart';
import 'package:mano_ai/apis/apis.dart';
import 'package:mano_ai/helper/my_dialog.dart';
//import 'package:path_provider/path_provider.dart';

import '../helper/global.dart';

enum Status { none, loading, complete }

class ImageController extends GetxController {
  final textC = TextEditingController();

  final status = Status.none.obs;

  final url = ''.obs;

  final imageList = <String>[].obs;

  Future<void> createAIImage() async {
    if (apiKey == apiKey.isEmpty) {
      MyDialog.error(
          'API key is missing! Please add a valid API key to proceed.');
      return;
    }

    if (textC.text.trim().isNotEmpty) {
      OpenAI.apiKey = apiKey;
      status.value = Status.loading;

      try {
        OpenAIImageModel image = await OpenAI.instance.image.create(
          prompt: textC.text,
          n: 1,
          size: OpenAIImageSize.size512,
          responseFormat: OpenAIImageResponseFormat.url,
        );
        url.value = image.data[0].url.toString();
        textC.text = '';
        status.value = Status.complete;
      } catch (e) {
        MyDialog.error(
            'Failed to generate image. Please check your internet connection.');
        status.value = Status.none;
      }
    } else {
      MyDialog.info('Provide some beautiful image description!');
    }
  }

  // void downloadImage() async {
  //   try {
  //     //To show loading
  //     MyDialog.showLoadingDialog();

  //     log('url: $url');

  //     final bytes = (await get(Uri.parse(url.value))).bodyBytes;
  //     final dir = await getTemporaryDirectory();

  //     final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

  //     log('filePath: ${file.path}');
  //     //save image to gallery
  //     await GallerySaver.saveImage(file.path, albumName: appName)
  //         .then((success) {
  //       //hide loading
  //       Get.back();

  //       MyDialog.success('Image Downloaded to Gallery!');
  //     });
  //   } catch (e) {
  //     //hide loading
  //     Get.back();
  //     MyDialog.error('Something Went Wrong (Try again in sometime)!');
  //     log('downloadImageE: $e');
  //   }
  // }

  Future<void> searchAiImage() async {
    //if prompt is not empty
    if (textC.text.trim().isNotEmpty) {
      status.value = Status.loading;
      imageList.value = await APIs.searchAiImages(textC.text);

      if (imageList.isEmpty) {
        MyDialog.error('Something went wrong (Please Try again later)');

        return;
      }

      url.value = imageList.first;

      status.value = Status.complete;
    } else {
      MyDialog.info('Provide some beautiful image description!');
    }
  }
}
