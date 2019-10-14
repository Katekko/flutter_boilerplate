import 'dart:core';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class LoadingBloc extends BlocBase {
  final _loadingController = BehaviorSubject<bool>();
  Observable<bool> get loadingStream => _loadingController.stream;

  void isLoading({@required bool isLoading}) async {
    try {
      _loadingController.sink.add(isLoading);
    } catch (err) {
      _loadingController.sink.addError(err);
    }
  }

  @override
  void dispose() {
    _loadingController.close();
    super.dispose();
  }
}
