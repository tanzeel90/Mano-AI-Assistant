import 'dart:convert';
import 'dart:io';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:mano_ai/helper/global.dart';

class APIs {
  // grt answer from chat
  static Future<String> getAnswer(String question) async {
    try {
      final res =
          await post(Uri.parse("https://api.openai.com/v1/chat/completions"),

              //headers
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
                HttpHeaders.authorizationHeader: 'Bearer $apiKey'
              },

              //body
              body: jsonEncode({
                "model": "gpt-3.5-turbo",
                "max_tokens": 2000,
                "temperature": 0,
                "messages": [
                  {"role": "user", "content": question},
                ]
              }));

      final data = jsonDecode(res.body);

      log('res : $data');
      return data['choices'][0]['message']['content'];
    } catch (e) {
      log('getAnswerE: $e');
      return 'Something get wrong (Try again later)';
    }
  }

  //for image from lexica
  static Future<List<String>> searchAiImages(String prompt) async {
    try {
      final res =
          await get(Uri.parse('https://lexica.art/api/v1/search?q=$prompt'));

      final data = jsonDecode(res.body);
      //
      return List.from(data['images']).map((e) => e['src'].toString()).toList();
    } catch (e) {
      log('searchAiImagesE: $e');
      return [];
    }
  }
}
