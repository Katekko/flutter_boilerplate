import 'package:flutter/material.dart';

import 'core/libs/navigation.lib.dart';

void main() {
  // TODO: add locations here
  return runApp(
    MaterialApp(
      initialRoute: '/',
      onGenerateRoute: NavigationLib.generateRoutes,
    ),
  );
}
