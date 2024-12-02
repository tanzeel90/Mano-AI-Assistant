import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mano_ai/screen/feature/chatbot_feature.dart';
//import 'package:mano_ai/screen/feature/translator_feature.dart';

import '../screen/feature/image_feature.dart';

enum HomeType { aiChatbot, aiImage }

extension MyHomeType on HomeType {
  //title
  String get title => switch (this) {
        HomeType.aiChatbot => 'Chatbot',
        HomeType.aiImage => 'Image Generator',
      };

  //lottie
  String get lottie => switch (this) {
        HomeType.aiChatbot => 'ai_ask.json',
        HomeType.aiImage => 'ai_play.json',
      };

  //alignment for lottie
  bool get leftAlign => switch (this) {
        HomeType.aiChatbot => true,
        HomeType.aiImage => false,
      };

  //for padding
  EdgeInsets get padding => switch (this) {
        HomeType.aiChatbot => EdgeInsets.zero,
        HomeType.aiImage => EdgeInsets.zero,
      };
  //for padding
  VoidCallback get OnTap => switch (this) {
        HomeType.aiChatbot => () => Get.to(() => const ChatbotFeature()),
        HomeType.aiImage => () => Get.to(() => const ImageFeature()),
      };
}
