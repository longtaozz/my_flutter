import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
/**
 * 一些工具控件
 * @author lt
 * @time 2019/1/18 13:35
 *
 **/

//加载框
Widget buildProgressIndicator(bool needLoad, context) {
  Widget bottomWidget = (needLoad)
      ? new WillPopScope(
          onWillPop: null, //显示加载框的时候禁止触发返回事件
          child: GestureDetector(
            onTap: null, //禁止点击事件
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration:
                    BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5) //设置黑色透明
                        ),
                alignment: Alignment.center,
                child: new Center(
                  child: new SpinKitCircle(color: Colors.red),
                ) //加载框
                ),
          ),
        )

      /// 不需要加载
      : new Container();
  return bottomWidget;
}

//广告轮播
class carrousel extends StatefulWidget {
  Widget child; // 轮播的内容
  Duration duration; // 轮播时间
  double stepOffset; // 偏移量
  double paddingLeft; // 内容之间的间距
  Axis axis; //滚动方向,默认水平

  carrousel(this.child, this.paddingLeft, this.duration, this.stepOffset,
      {this.axis = Axis.horizontal});

  _carrouselState createState() => _carrouselState();
}

class _carrouselState extends State<carrousel> {
  ScrollController _controller; // 执行动画的controller
  Timer _timer; // 定时器timer
  double _offset = 0.0; // 执行动画的偏移量

  @override
  void initState() {
    super.initState();

    _controller = ScrollController(initialScrollOffset: _offset);
    _timer = Timer.periodic(widget.duration, (timer) {
      double newOffset = _controller.offset + widget.stepOffset;
      if (newOffset != _offset) {
        _offset = newOffset;
        _controller.animateTo(_offset,
            duration: widget.duration, curve: Curves.linear); // 线性曲线动画
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  Widget _child() {
    return Column(mainAxisSize: MainAxisSize.min, children: _children());
  }

  // 子视图
  List<Widget> _children() {
    List<Widget> items = [];
    for (var i = 0; i <= 0; i++) {
      Container item = new Container(
        margin: new EdgeInsets.only(bottom: i != 0 ? 0.0 : widget.paddingLeft),
        child: widget.child,
      );
      items.add(item);
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 0,
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child:Container(
        height: 100,
        child: ListView.builder(
        scrollDirection: widget.axis, // 滚动方向
        controller: _controller, // 滚动的controller
        itemBuilder: (context, index) {
          return _child();
        },
      ),)
        ,
    );
  }
}
