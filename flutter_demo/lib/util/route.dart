import 'package:flutter/material.dart';

/**
 * 路由封装
 * @author lt
 * @time 2019/1/8 16:09
 *
 **/
class MRoute {
  static void goWidget(BuildContext context, Widget w) {
    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
        (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
      return w;
    }, transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      // 添加一个平移动画
      return MRoute.createTransition(animation, child);
    }));
  }

  /// 创建一个平移变换
  /// 跳转过去查看源代码，可以看到有各种各样定义好的变换
  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child, // child is the value returned by pageBuilder
    );
  }
}
