import 'package:flutter/material.dart';
import 'view/user/login.dart';
import 'view/main/ylt_home.dart';
import 'util/ToolsUtil.dart';
import 'package:flutter_demo/widget/ylt_home_widget.dart';
import 'widget/text.dart';
import 'view/main/ylt_main.dart';

void main(){
  runApp(new MaterialApp(
    title: 'LApp',
    theme: ThemeData(
//      primarySwatch: Colors.black12,
    ),
//    home: Login(),
    home: Container(color: Colors.red,child: textW(),height: 100,),
    routes: <String ,WidgetBuilder>{
      '/ylt/main': (BuildContext context) => new ylt_main(),
    },
  ));
}

class textW extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return advertising(context);
  }

}


