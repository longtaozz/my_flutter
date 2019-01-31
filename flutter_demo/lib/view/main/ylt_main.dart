import 'package:flutter/material.dart';
import 'ylt_home.dart';

class ylt_main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ylt_main_state();
  }
}

class ylt_main_state extends State<ylt_main> {
  int _tabIndex = 0;

  var numbers;

  var appBarTitles;

  var appBarIcons;

  var _widgets;

  void _clickBoot(inx) {
    setState(() {
      _tabIndex = inx;
    });
  }

  void initData() {
    _widgets = [
      yltHome(),
      Text("2"),
      Text("3"),
      Text("4"),
      Text("5"),
    ];
    appBarTitles = ['首页', '地接', '操作', '朋友', '我的'];
    numbers = [0, 1, 2, 3, 4];
    appBarIcons = [
      Icons.home,
      Icons.assignment,
      Icons.rate_review,
      Icons.group,
      Icons.assignment_ind
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    // TODO: implement build
    return Scaffold(
        body: _widgets[_tabIndex],
        bottomNavigationBar: new BottomNavigationBar(
            onTap: (i) {
              _clickBoot(i);
            },//设置显示的模式
            type: BottomNavigationBarType.fixed,
            currentIndex: _tabIndex,
//          items: numbers
//              .map((num) => new BottomNavigationBarItem(
//                  icon: getIcons(num), title: getTabTitle(num)))
//              .toList()),
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem(
                icon: getIcons(0),
                title: getTabTitle(0),
              ),
              new BottomNavigationBarItem(
                icon: getIcons(1),
                title: getTabTitle(1),
              ),
              new BottomNavigationBarItem(
                icon: getIcons(2),
                title: getTabTitle(2),
              ),
              new BottomNavigationBarItem(
                icon: getIcons(3),
                title: getTabTitle(3),
              ),
              new BottomNavigationBarItem(
                icon: getIcons(4),
                title: getTabTitle(4),
              ),
            ])
    );
  }

  //文字点击改变
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 13.0, color: Colors.blue));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 13.0, color: Colors.black));
    }
  }

  //图标点击改变
  Widget getIcons(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Icon(
        appBarIcons[curIndex],
        size: 24,
        color: Colors.blue,
      );
    } else {
      return new Icon(
        appBarIcons[curIndex],
        size: 24,
        color: Colors.black,
      );
    }
  }
}
