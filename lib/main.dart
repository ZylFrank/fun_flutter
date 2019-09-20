import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:fun_flutter/config/router_config.dart';


void main() {
  runApp(App());
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor:Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      hideFooterWhenNotFull: true, //列表数据不满一页,不触发加载更多
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Router.generateRoute, // 路由生成钩子
        initialRoute: RouteName.tab,
      ),
    );
  }
}