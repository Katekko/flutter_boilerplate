import 'dart:async';
import 'dart:convert';

import 'package:flutter_boilerplate/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RestCoreLib {
  static final JsonDecoder _decoder = JsonDecoder();

  static Future<dynamic> get(
    String url, {
    mimeType = 'json',
  }) async {
    try {
      final ambiente = ConfigEnvironments.getEnvironments();
      final http.Response response = await http.get(
        ambiente['url'] + url,
        headers: await _getHeaders(mimeType),
      );

      if (_isSuccessRequest(response.statusCode)) {
        final output = _decoder.convert(response.body);
        return output;
      } else {
        throw Exception('Falha ao obter dados');
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future<dynamic> post(
    String url, {
    body,
    mimeType = 'json',
  }) async {
    try {
      final ambiente = ConfigEnvironments.getEnvironments();
      final http.Response response = await http.post(
        ambiente['url'] + url,
        body: body,
        headers: await _getHeaders(mimeType),
        encoding: Encoding.getByName('utf-8'),
      );

      if (_isSuccessRequest(response.statusCode)) {
        final output = _decoder.convert(response.body);
        return output;
      } else {
        throw Exception('Falha ao obter dados');
      }
    } catch (e) {
      throw (e);
    }
  }

  static bool _isSuccessRequest(int httpCode) {
    return httpCode >= 200 && httpCode < 300;
  }

  static Future<Map<String, String>> _getHeaders(String mimetype) async {
    final _prefs = await SharedPreferences.getInstance();
    final _token = _prefs.getString('token');

    Map<String, String> headers = new Map<String, String>();
    headers.addAll({"Accept": "application/" + mimetype});
    if (_token != null) {
      headers.addAll({"Authorization": "bearer " + _token});
    }

    return Future.value(headers);
  }
}
