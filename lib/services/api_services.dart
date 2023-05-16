import 'dart:convert';
import 'dart:developer';
import 'dart:io'; 

import 'package:http/http.dart' as http;

import '../models/models.dart';

String BASE_URL = 'https://api.openai.com/v1/';
String API_KEY = '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';

class ApiService {
  static Future<List<Models>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse('$BASE_URL/models'),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        // print('jsonResponse["error"] ${jsonResponse['error']['message']}');
        throw HttpException(jsonResponse['error']['message']);
      }

      // print('jsonresponse: $jsonResponse');

      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        log('temp ${value["id"]}');
      }
      return Models.modelsFromSnapshot(temp);
    } catch (e) {
      log('error: $e');
      rethrow;
    }
  }
}
