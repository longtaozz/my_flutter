import 'package:flutter/material.dart';
import 'package:flutter_demo/util/ToolsUtil.dart';
import 'package:flutter_demo/util/toast.dart';
import 'package:flutter_demo/widget/clean_text_field.dart';
import 'package:flutter_demo/widget/ylt_home_widget.dart';
import 'package:flutter_demo/widget/text.dart';
import 'package:flutter_demo/widget/MBanner.dart';

TextEditingController searchx = TextEditingController(); //输入框
FocusNode searchx_fn = FocusNode();

//主页
class yltHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                bannerX(),
                new Container(
                  width: MediaQuery.of(context).size.width,
                  child: new midG(),
                ), //中间的按钮
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: advertising(context),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                  ),
                ), //广告
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 50, left: 30, right: 30),
            child: TextField(
              controller: searchx,
              focusNode: searchx_fn,
              keyboardType: TextInputType.text,
              //键盘类型
              textInputAction: TextInputAction.search,
              //完成键，软键盘上的。
              cursorWidth: 1,
              //光标宽度，默认2.0
              cursorColor: Colors.blue,
              style: TextStyle(
                color: Colors.black,
              ),
              onEditingComplete: () {
                Toast.toast(context, searchx.text);
              },
              //输入完成监听
              //光标颜色
              decoration: InputDecoration(
                //装饰，
                filled: true,
                fillColor: Color.fromRGBO(255, 255, 255, 0.7),
                prefixIcon: Container(
                  child: GestureDetector(
                    child: Icon(
                      Icons.search,
                    ),
                    onTap: () {
                      Toast.toast(context, searchx.text);
                    },
                  ),
                ),
                hintText: "搜索酒店",
                focusedBorder: OutlineInputBorder(
                    //获得焦点边框
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                enabledBorder: OutlineInputBorder(
                    //开始时边框
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                contentPadding: EdgeInsets.all(15),
              ),
            ),
          ), //搜索框
        ],
      ),
    );
  }
}
