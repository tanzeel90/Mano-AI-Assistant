import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:mano_ai/helper/global.dart';

class AppWrite {
  static final _client = Client();
  static final _database = Databases(_client);
  static void init() {
    _client
        .setEndpoint('http://cloud.appwrite.io/v1')
        .setEndpoint('673d8403000e167efcc3')
        .setSelfSigned(status: true);
    getApiKey();
  }

  static Future<String> getApiKey() async {
    try {
      final d = await _database.getDocument(
          databaseId: 'MyDatabase',
          collectionId: 'ApiKey',
          documentId: 'chatGptKey');

      apiKey = d.data['apiKey'];
      log(apiKey);
      return apiKey;
    } catch (e) {
      log('$e');
      return '';
    }
  }
}
