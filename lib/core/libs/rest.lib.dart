import 'dart:async';
import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/config.dart';
import 'package:flutter_boilerplate/core/blocs/loading.bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RestLib {
  final JsonDecoder _decoder = JsonDecoder();
  final ConfigEnvironments _config = ConfigEnvironments();
  final LoadingBloc _loadingBloc = BlocProvider.tag('HomeBloc').getBloc<LoadingBloc>();

  Future<dynamic> get({
    @required String url,
    mimeType = 'json',
  }) async {
    try {
      _loadingBloc.isLoading(isLoading: true);
      final ambiente = _config.getEnvironments();
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
      throw Exception(e);
    } finally {
      _loadingBloc.isLoading(isLoading: false);
    }
  }

  Future<dynamic> post({
    @required String url,
    body,
    mimeType = 'json',
  }) async {
    try {
      final ambiente = _config.getEnvironments();
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
      throw Exception(e);
    }
  }

  bool _isSuccessRequest(int httpCode) {
    return httpCode >= 200 && httpCode < 300;
  }

  Future<Map<String, String>> _getHeaders(String mimetype) async {
    final _prefs = await SharedPreferences.getInstance();

    Map<String, String> headers = Map<String, String>();
    headers.addAll({'Accept': 'application/' + mimetype});
    if (_prefs.containsKey('token')) {
      headers.addAll({'Authorization': 'bearer ' + _prefs.getString('token')});
    }

    return Future.value(headers);
  }
}
