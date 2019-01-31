import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_demo/util/toast.dart';
import 'package:flutter_demo/util/ToolsUtil.dart';
import 'package:flutter_demo/util/HttpUtil.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      resizeToAvoidBottomPadding: false, //键盘弹出不调整大小
      appBar: null,
      body: BoolChang(),
    );
  }
}

class _BoolChangState extends State<BoolChang> {
  var _bActive = false;

  TextEditingController enterprise = TextEditingController(); //企业号
  TextEditingController userName = TextEditingController(); //工号
  TextEditingController password = TextEditingController(); //密码
  FocusNode enterprise_fn = FocusNode();
  FocusNode userName_fn = FocusNode();
  FocusNode password_fn = FocusNode();

  void _handleTapBoxBChanged(bool value) {
    setState(() {
      _bActive = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/loginbj_min.jpg"),
                fit: BoxFit.fill),
//            border: BorderDirectional(bottom: BorderSide(color: Colors.red)),//底部边框
          ),
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      "优旅通",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      //企业号
                      controller: enterprise,
                      //输入框控制器，获取输入框内容
                      focusNode: enterprise_fn,
                      //控制判断控件是否获取焦点
                      textInputAction: TextInputAction.next,
                      //完成键，软键盘上的。
                      obscureText: false,
                      //输入是否模糊，就是密码框那种
                      onChanged: (str) {
//                      print(str);
                      },
                      //输入改变监听
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(userName_fn);
                      },
                      //输入完成监听
                      onSubmitted: (str) {
//                      print(str);
                      },
                      //提交监听
//                  inputFormatters: <TextInputFormatter>[//输入限定，需导入flutter/services.dart包
//                    WhitelistingTextInputFormatter.digitsOnly,//只许输入数字，长度限制LengthLimitingTextInputFormatter等
//                  ],
                      cursorWidth: 2,
                      //光标宽度，默认2.0
                      cursorColor: Colors.blue,
                      //光标颜色
//                  cursorRadius: Radius.zero,
                      onTap: () {
//                      print("ontap");
                      },
                      //点击输入框监听事件
                      decoration: InputDecoration(
                        //装饰，
//                    icon: Icon(Icons.account_circle),//图标，默认放置于输入框前
                        labelText: "企业号",
                        //提示，默认得到焦点上移
                        labelStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          //字体样式
                          letterSpacing: 2, //放大字距
                        ),
//                    helperText: "用户", //辅助文本，显示在输入框下
//                    helperStyle:,//设置辅助文本样式
                        hintText: "请输入企业号",
                        //提示文字，输入框内
                        hintStyle: TextStyle(color: Colors.black45),
                        //输入文字样式
                        //输入框提示最大行数
//                    errorText: "",//错误提示
                        contentPadding: EdgeInsets.all(8),
                        //内容填充
                        prefixIcon: Icon(Icons.account_balance),
                        //前缀图标
//                    suffixIcon: FlatButton(onPressed: (){}, child: Icon(Icons.clear)),//后缀图标
                        focusedBorder: OutlineInputBorder(
                            //获得焦点边框
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: OutlineInputBorder(
                            //开始时边框
                            borderSide: BorderSide(color: Colors.black54)),
                      ),
                    ),
                    padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                  ),
                  Container(
                    child: TextField(
                      //帐号，工号
                      controller: userName,
                      //输入框控制器，获取输入框内容
                      focusNode: userName_fn,
                      //控制判断控件是否获取焦点
                      textInputAction: TextInputAction.next,
                      //完成键，软键盘上的。
                      obscureText: false,
                      //输入是否模糊，就是密码框那种
                      onChanged: (str) {
//                      print(str);
                      },
                      //输入改变监听
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(password_fn);
                      },
                      //输入完成监听
                      onSubmitted: (str) {
//                      print(str);
                      },
                      //提交监听
//                  inputFormatters: <TextInputFormatter>[//输入限定，需导入flutter/services.dart包
//                    WhitelistingTextInputFormatter.digitsOnly,//只许输入数字，长度限制LengthLimitingTextInputFormatter等
//                  ],
                      cursorWidth: 2,
                      //光标宽度，默认2.0
                      cursorColor: Colors.blue,
                      //光标颜色
//                  cursorRadius: Radius.zero,
                      onTap: () {
//                      print("ontap");
                      },
                      //点击输入框监听事件
                      decoration: InputDecoration(
                        //装饰，
//                    icon: Icon(Icons.account_circle),//图标，默认放置于输入框前
                        labelText: "工号",
                        //提示，默认得到焦点上移
                        labelStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          //字体样式
                          letterSpacing: 2, //放大字距
                        ),
//                    helperText: "用户", //辅助文本，显示在输入框下
//                    helperStyle:,//设置辅助文本样式
                        hintText: "请输入企业工号",
                        //提示文字，输入框内
                        hintStyle: TextStyle(color: Colors.black45),
                        //输入文字样式
                        //输入框提示最大行数
//                    errorText: "",//错误提示
                        contentPadding: EdgeInsets.all(8),
                        //内容填充
                        prefixIcon: Icon(Icons.account_circle),
                        //前缀图标
//                    suffixIcon: FlatButton(onPressed: (){}, child: Icon(Icons.clear)),//后缀图标
                        focusedBorder: OutlineInputBorder(
                            //获得焦点边框
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: OutlineInputBorder(
                            //开始时边框
                            borderSide: BorderSide(color: Colors.black54)),
                      ),
                    ),
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  ),
                  Container(
                    child: TextField(
                      //密码
                      controller: password,
                      //输入框控制器，获取输入框内容
                      focusNode: password_fn,
                      //控制判断控件是否获取焦点
                      textInputAction: TextInputAction.send,
                      //完成键，软键盘上的。
                      obscureText: true,
                      //输入是否模糊，就是密码框那种
                      onChanged: (str) {
//                      print(str);
                      },
                      //输入改变监听
                      onEditingComplete: () {
//                      print("完成");
                      },
                      //输入完成监听
                      onSubmitted: (str) {
//                      print(str);
                      },
                      //提交监听
//                  inputFormatters: <TextInputFormatter>[//输入限定，需导入flutter/services.dart包
//                    WhitelistingTextInputFormatter.digitsOnly,//只许输入数字，长度限制LengthLimitingTextInputFormatter等
//                  ],
                      cursorWidth: 2,
                      //光标宽度，默认2.0
                      cursorColor: Colors.blue,
                      //光标颜色
//                  cursorRadius: Radius.zero,
                      onTap: () {
//                      print("ontap");
                      },
                      //点击输入框监听事件
                      decoration: InputDecoration(
                        //装饰，
//                    icon: Icon(Icons.account_circle),//图标，默认放置于输入框前
                        labelText: "密码",
                        //提示，默认得到焦点上移
                        labelStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          //字体样式
                          letterSpacing: 2, //放大字距
                        ),
//                    helperText: "用户", //辅助文本，显示在输入框下
//                    helperStyle:,//设置辅助文本样式
                        hintText: "请输入密码",
                        //提示文字，输入框内
                        hintStyle: TextStyle(color: Colors.black45),
                        //输入文字样式
                        //输入框提示最大行数
//                    errorText: "",//错误提示
                        contentPadding: EdgeInsets.all(8),
                        //内容填充
                        prefixIcon: Icon(Icons.apps),
                        //前缀图标
//                    suffixIcon: FlatButton(onPressed: (){}, child: Icon(Icons.clear)),//后缀图标
                        focusedBorder: OutlineInputBorder(
                            //获得焦点边框
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: OutlineInputBorder(
                            //开始时边框
                            borderSide: BorderSide(color: Colors.black54)),
                      ),
                    ),
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  ),
                  Container(
                    child: new GestureDetector(
                      child: Text(
                        "忘记密码？",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                      onPanDown: (DrD) {
                        Toast.toast(context, "请联系管理员~");
                      },
                    ),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(top: 20, right: 20),
                  ),
                  Container(
                    child: RaisedButton(
                      onPressed: () {
                        if (enterprise.text == null || enterprise.text == "") {
                          Toast.toast(context, "企业号不能为空");
                          FocusScope.of(context).requestFocus(enterprise_fn);
                          return;
                        }
                        if (userName.text == null || userName.text == "") {
                          Toast.toast(context, "工号不能为空");
                          FocusScope.of(context).requestFocus(userName_fn);
                          return;
                        }
                        if (password.text == null || password.text == "") {
                          Toast.toast(context, "密码不能为空");
                          FocusScope.of(context).requestFocus(password_fn);
                          return;
                        }
                        _handleTapBoxBChanged(true); //打开加载条
                        _login();
                      },
                      child: Text(
                        "登录",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.blue,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      padding: EdgeInsets.all(11),
                    ),
                    padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                  ),
                ],
              ),
              buildProgressIndicator(_bActive, context),
            ],
          )),
    );
  }

  _login() async {
    HttpSet h = HttpSet.init();
    var cc = await h.Get("http://www.baidu.com");
    _handleTapBoxBChanged(false); //关闭加载条
    if (cc == 1) {
      Toast.toast(context, "请求出错");
    } else {
      //登录成功
      Navigator.of(context).pushNamed('/ylt/main');
    }
  }
}

class BoolChang extends StatefulWidget {
  @override
  _BoolChangState createState() {
    return new _BoolChangState();
  }
}
