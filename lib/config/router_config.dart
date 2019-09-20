import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:fun_flutter/page/tab_navigator.dart';

class RouteName {
  static const String tab = '/'; 
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.tab:
        return CupertinoPageRoute(builder: (_) => TabNavigator());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          )
        );
    }
  }
}