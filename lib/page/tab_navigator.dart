import 'package:flutter/material.dart';

import 'package:fun_flutter/page/home.dart';
import 'package:fun_flutter/page/page2.dart';
import 'package:fun_flutter/page/page3.dart';

List<Widget> pages = <Widget>[
  HomePage(),
  Page2(),
  Page3(),
];

class TabNavigator extends StatefulWidget {
  TabNavigator({ Key key}) : super(key:key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>{
  int _selectedIndex = 0;
  var _pageController = PageController();
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope( // 防止误触返回键而退出应用
        onWillPop: () async{
          
          if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        },
        child: PageView.builder(
          itemBuilder: (ctx, index) => pages[index],
          itemCount: pages.length,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("one"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            title: Text("tewo"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            title: Text("three"),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ) 
    );
  }
}