import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'util/toast.dart';
import 'util/route.dart';

void main() {
//  runApp(new MaterialApp(
//    title: "容器",
//    home: ss(),
//  ));
  runApp(new MaterialApp(
    title: "demo",
    home: new tabBar(tStr: "第一次进页面"),
//    routes: <String, WidgetBuilder>{
//      '/router/home': (BuildContext context) => new Container3(),
//      '/router/tab': (BuildContext context) => new tabBar(),
//    },
  ));
}

class containerx extends StatelessWidget {
  static _nullContainer() {
    return new Container(
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("容器container"),
      ),
      body: Center(
        child: Container(
          //相当于直接制定了该Container的宽或高，且它的优先级要高于width和height
          constraints: BoxConstraints.expand(
            height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
          ),
          padding: const EdgeInsets.all(8.0),
          //最后EdgeInsetsGeometry填充
          color: Colors.teal.shade700,
          //框架自带水鸭色
//          alignment: Alignment.center,//对齐，左右(0.0 0.0):表示矩形的中心，以坐标的形式范围-1.0~1.0,
          alignment: Alignment(0.2, -0.5),
          //右上
          /**
           * child：小部件,只能有一个子部件，如果需要很多子部件需要将布局设置为Row（行）, Column（列）, or Stack（堆）
           */
          child: Text('Hello World', //Text:文本，详细看源码属性设置
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(color: Colors.white)),
          //foregroundDecoration:布局装饰，前景
          foregroundDecoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'http://img.zcool.cn/community/01f9ea56e282836ac72531cbe0233b.jpg@2o.jpg'),
//              centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
            ),
          ),
          transform: Matrix4.rotationZ(0.1),
        ),
      ),
    );
  }
}

class ss extends StatelessWidget {
  Widget cc(BuildContext context) {
    return new Container(
      //相当于直接制定了该Container的宽或高，且它的优先级要高于width和height
      constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
      ),
      padding: const EdgeInsets.all(8.0),
      //最后EdgeInsetsGeometry填充
      color: Colors.teal.shade700,
      //框架自带水鸭色
//          alignment: Alignment.center,//对齐，左右(0.0 0.0):表示矩形的中心，以坐标的形式范围-1.0~1.0,
      alignment: Alignment(0.2, -0.5),
      //右上
      /**
       * child：小部件,只能有一个子部件，如果需要很多子部件需要将布局设置为Row（行）, Column（列）, or Stack（堆）
       */
      child: Text('Hello World', //Text:文本，详细看源码属性设置
          style: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: Colors.white)),
      //foregroundDecoration:布局装饰
      foregroundDecoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'http://img.zcool.cn/community/01f9ea56e282836ac72531cbe0233b.jpg@2o.jpg'),
//              centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
        ),
      ),
      transform: Matrix4.rotationZ(0.1),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("容器2"),
      ),
      body: new Column(
        children: <Widget>[
          cc(context),
          new Container(
            constraints: BoxConstraints.expand(
              height: 100,
              width: 200,
            ),
            color: Colors.red,
            //沿左上角顶点顺时针旋转
            transform: new Matrix4.rotationZ(6.0),
          ),
          Expanded(
              child: new Container(
            color: Colors.purple,
          )),
          new Container(
            width: 500,
            height: 100,
            decoration: new BoxDecoration(
              border: new Border.all(width: 2.0, color: Colors.red),
              color: Colors.grey,
              borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
              image: new DecorationImage(
                image: new NetworkImage(
                    'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
                centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
              ),
            ),
          ),
//          new ListView(
//            children: <Widget>[
//              _cc(context),
//            ],
//          ),
        ],
      ),
    );
  }
}

class list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("容器2"),
        //标题
        leading: new RawMaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.only(left: 0, right: 0),
            constraints: const BoxConstraints(minWidth: 0.0, minHeight: 0.0),

            ///flex
            child: new Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              direction: Axis.horizontal,
              children: <Widget>[new Icon(Icons.arrow_back)],
            ),
            onPressed: () {
              Toast.toast(context, "返回返回返回");
            }),
        automaticallyImplyLeading: true,
        //怎么设置都没用啊。
        actions: <Widget>[
          //标题右边的布局，部件从右边开始，多个布局会往左挤
          new IconButton(
            icon: Icon(Icons.add_location),
            onPressed: () {
              Toast.toast(context, "点击右边");
            },
            padding: EdgeInsets.only(left: 10, right: 10),
          ),
          new IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Toast.toast(context, "点击右边");
            },
          ),
        ],
//        flexibleSpace: new Text("111111"),
        bottom: PreferredSize(
            child: new Row(
              children: <Widget>[Text("one"), Text("Tuo"), Text("three")], //布局
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            preferredSize: Size(0, 10)),
        //大小
        elevation: 10,
        //高度。其实就是用阴影给人立体的高度
        backgroundColor: Colors.pink,
        //背景颜色
        brightness: Brightness.light,
        //亮度
        iconTheme: IconThemeData(color: Colors.black, opacity: 0.9),
        //改变图标颜色，透明度，大小
        textTheme: TextTheme(display1: TextStyle(color: Colors.blue)),
        //太复杂，而且感觉没什么用
        primary: true,
        //设置导航栏的内容是否无视手机的导航栏
        centerTitle: true,
        //导航标题是否居中
        titleSpacing: 1,
        //不知道怎么用
        toolbarOpacity: 0.5,
        //标题透明度。
        bottomOpacity: 0.5, //底部标题透明度
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          const Text('I\'m dedicating every day to you'),
          const Text('Domestic life was never quite my style'),
          const Text('When you smile, you knock me out, I fall apart'),
          const Text('And I thought I was so smart'),
          ss().cc(context),
          new Container(
            constraints: BoxConstraints.expand(
              height: 100,
              width: 200,
            ),
            color: Colors.red,
            //沿左上角顶点顺时针旋转
            transform: new Matrix4.rotationZ(6.0),
          ),
          new Container(
            width: 100,
            height: 100,
            decoration: new BoxDecoration(
              border: new Border.all(width: 2.0, color: Colors.red),
              color: Colors.grey,
              borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
              image: new DecorationImage(
                image: new NetworkImage(
                    'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
                centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
              ),
            ),
          ),
          new Row(
            //主轴的尺寸，min为不占有剩余部分
            mainAxisSize: MainAxisSize.min,
            //主轴对齐方式，此为各个控件平均分配
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //和主轴相对，这里为纵轴，
            crossAxisAlignment: CrossAxisAlignment.baseline,
            //文本显示顺序，此为逆序
            textDirection: TextDirection.rtl,
            //不知道干嘛的，垃圾
            textBaseline: TextBaseline.ideographic,
            //不知道干嘛的，没什么效果
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text("ba111"),
              Text("fg222222222"),
              Container(
                width: 100,
                height: 100,
                color: Colors.black12,
              ),
            ],
          ),
          Column(
            //主轴的尺寸，min为不占有剩余部分
            mainAxisSize: MainAxisSize.max,
            //主轴对齐方式，此为各个控件平均分配
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //交叉轴，应该是主轴相对的轴
            crossAxisAlignment: CrossAxisAlignment.center,
            //文本显示顺序，此为逆序
            textDirection: TextDirection.rtl,
            //不知道干嘛的，垃圾
            textBaseline: TextBaseline.ideographic,
            //不知道干嘛的，没什么效果
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text("ba111"),
              Text("fg222222222"),
              Container(
                width: 100,
                height: 100,
                color: Colors.black12,
              ),
            ],
          ),
          //加载本地图片，
          Image.file(new File("DCIM/Camera/IMG_20180802_091315.jpg")),
          //加载资源文件
          Image.asset("assets/images/jn_yunshu_home_message.png"),
          //加载bytes文件，没试i
//          Image.memory(bytes)
          //加载网络图片
          Image.network(
            "http://img5.duitang.com/uploads/item/201411/07/20141107164412_v284V.jpeg",
            width: 300,
            height: 200,
            color: Colors.purple,
            colorBlendMode: BlendMode.colorBurn, //颜色加深
          ),
          //加载网络图片2
          new Directionality(
            textDirection: TextDirection.rtl,
            child: Image(
              image: new NetworkImage(
                  "http://pic28.photophoto.cn/20130818/0020033183970083_b.jpg"),
              semanticLabel: "网络图片2",
              //和excludeFromSemantics配合使用
              excludeFromSemantics: true,
              //但是好像也没效果（可能是手机版本太低）
              width: 1000,
              height: 200,
              color: Colors.purple,
              colorBlendMode: BlendMode.color,
              alignment: Alignment.centerLeft,
//            fit: BoxFit.fitHeight,
              //合适的高度，原图按高度缩放的意思
//            repeat: ImageRepeat.noRepeat,//横向平铺，与fit冲突
              //实现android中的9官图效果，然而~
//            centerSlice: Rect.fromLTRB(100, 100, 100, 100),
              matchTextDirection: true,
              //开启文字绘制方向
              filterQuality: FilterQuality.high, //滤镜级别,高（然而~）
            ),
          ),
          Text(
            "我是一个demo啊，好开心，this my demo~",
            style: TextStyle(
              color: Colors.amberAccent,
              //颜色
              fontSize: 15,
              fontWeight: FontWeight.bold,
              //字体粗细
              fontStyle: FontStyle.italic,
              //字体样式，斜体
              letterSpacing: 10,
              //字的间隙
              wordSpacing: 10,
              //单词间隙（指的英文单词）
              textBaseline: TextBaseline.alphabetic,
              //文本绘制基线(alphabetic/ideographic)，没什么效果
              height: 3,
              //行与行的间距
              locale: Locale("dasdad"),
              //区域设置，额，不知道是不是这么用的，没效果
//              foreground: Paint(),//前景，不知道怎么用，以后再看
//              background: Paint(),//背景，不知道怎么用
//              shadows: _getList,//阴影，不知道怎么用
              decoration: TextDecoration.underline,
              //装饰，麻烦
              decorationColor: Colors.blue,
              //装饰颜色,装饰没设置出来，所以没效果
              decorationStyle: TextDecorationStyle.dashed,
              //装饰样式,装饰没设置出来，所以没效果
              debugLabel: "调试",
              //调试标签
              fontFamily: "", //字体
            ),
            textAlign: TextAlign.right,
            //文字的对齐方向，此为向右对齐
            textDirection: TextDirection.rtl,
            //文字顺序，this my demo~,
            locale: Locale("dasdad"),
            //和style的有什么区别？？？覆盖么？
            softWrap: false,
            //自动换行，false不换，默认为换行
            overflow: TextOverflow.fade,
            //溢出处理，消失
            textScaleFactor: 0.5, //文本比例
          ),
          new Icon(
            Icons.arrow_back,
            size: 20, //大小
            color: Colors.red, //颜色
            semanticLabel: "红色雪花", //帮助盲人或者视力有障碍的用户提供语言辅助描述
            textDirection: TextDirection
                .rtl, //渲染图标的方向,需要源码图标里能设置方向的，就是有matchTextDirection: true);的，如arrow_back
          ),
          ImageIcon(
            new NetworkImage(
                "http://pic28.photophoto.cn/20130818/0020033183970083_b.jpg"),
            size: 120, //大小
            color: Colors.black26, //颜色
            semanticLabel: "红色雪花", //帮助盲人或者视力有障碍的用户提供语言辅助描述
          ),
          IconButton(
            icon: new Icon(
              Icons.ac_unit,
              color: Colors.red,
            ),
            onPressed: () {
              Toast.toast(context, "点击IconButton");
            },
            //点击事件
            //size，alignment不写了
            padding: new EdgeInsets.all(30),
            //边距,点击范围没有随之扩大
            color: Colors.blue,
            //在icon没有设置color时有效，icon里设置color优先级大写
            highlightColor: Colors.purple,
            //高光颜色，点击颜色
            splashColor: Colors.amber,
            //飞溅颜色，点击的扩张颜色
            disabledColor: Colors.teal,
            //禁用按钮后的颜色
            tooltip: "您点击了~", //提示框，在长按两秒左右会弹出一个类似android Toast的框
          ),
          RaisedButton(
            onPressed: () {
              print("点击了");
              Toast.toast(context, "点击了");
            },
            onHighlightChanged: (bool) {
              print("onHighlightChanged");
              print(bool);
            },
            //按下和离开都触发这个事件,按下时bool为true，离开时为false
            textTheme: ButtonTextTheme.normal,
            //点击效果主题，内容和点击下过都会改变~
            child: Text("确定"),
            //设置按钮widget
            textColor: Colors.cyanAccent,
            //文字颜色和点击效果颜色
            disabledColor: Colors.black,
            //禁用按钮后的颜色
            color: Colors.teal,
            //按钮颜色
            disabledTextColor: Colors.black,
            //禁用按钮后的文字颜色
            highlightColor: Colors.deepOrange,
            //高光颜色，上面有
            splashColor: Colors.blue,
            //飞溅颜色，上面有
            colorBrightness: Brightness.light,
            //色彩亮度，light：高亮
            elevation: 3,
            //突出度,就是阴影大小
            highlightElevation: 1,
            //突出高度
            disabledElevation: 3,
            //禁用突出高度
            padding: EdgeInsets.all(20),
            //按钮边距，整个按钮会变化
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(
                    color: Color(0xFF342500),
                    style: BorderStyle.solid,
                    width: 1)),
            //外形，RoundedRectangleBorder：圆角
            clipBehavior: Clip.antiAlias,
            //剪辑，antiAlias：抗锯齿
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //没什么效果，懒得管了
            animationDuration: Duration(seconds: 2), //动画周期
          ),
//          Image.asset("images/banner2.png"),
//          Image.asset("images/banner1.png"),
        ],
      ),

      bottomSheet: new Row(
        //底部菜单
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.access_alarm),
              onPressed: () {
                Toast.toast(context, "1");
              }),
          IconButton(
              icon: Icon(Icons.add_location),
              onPressed: () {
                Toast.toast(context, "2");
              }),
          IconButton(
              icon: Icon(Icons.print),
              onPressed: () {
                Toast.toast(context, "3");
              }),
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Toast.toast(context, "4");
              }),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.black,
      ),
      //一个浮动在整个界面上方的按钮，布局，通常由FloatingActionButton展示
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //浮动位置，有centerFloat:中心浮动，centerDocked:中心停靠等(感觉中心浮动和中心停靠没什么区别)
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
//    return ListView(
//      children: <Widget>[
//        new Text("-----------------------"),
//        new Text("-----------------------"),
//        new Text("-----------------------"),
//        new Text("-----------------------"),
//        new Text("-----------------------"),
//        new Text("-----------------------"),
//      ],
//    );
    );
  }
}

class Container3 extends StatelessWidget {

  final String cStr;

  Container3({Key key,@required this.cStr}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("容器3"),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.add_location),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new tabBar(tStr: "跳转tab")));
            }),
        //没有点击事件是没有点击效果的
        actions: <Widget>[
          IconButton(
            icon: new Text(cStr),
            onPressed: () {},
            padding: EdgeInsets.symmetric(horizontal: 40),
          ),
        ],
        backgroundColor: Colors.black12,
      ),
      body: ListView(
        children: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text("Camera"),
                      onTap: () async {
                        Navigator.pop(context);
                      },
                    ),
                    new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text("Gallery"),
                      onTap: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        },
        backgroundColor: Colors.transparent,
        child: Icon(
          Icons.add_circle,
          size: 50,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //位置
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      //切换的动画效果，有默认的效果了
      bottomNavigationBar: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.access_alarm,
                size: 30,
              ),
              onPressed: () {
                Toast.toast(context, "5");
              }),
          IconButton(
              icon: Icon(
                Icons.map,
                size: 30,
              ),
              onPressed: () {
                Toast.toast(context, "6");
              }),
          IconButton(
              icon: Icon(
                Icons.account_balance_wallet,
                size: 30,
              ),
              onPressed: () {
                Toast.toast(context, "7");
              }),
          IconButton(
              icon: Icon(
                Icons.account_circle,
                size: 30,
              ),
              onPressed: () {
                Toast.toast(context, "8");
              }),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
//      persistentFooterButtons: <Widget>[new FloatingActionButton(
//        onPressed: (){},
//        tooltip: 'Increment',
//        child: new Icon(Icons.add),
//      )],
      drawer: ListView(
        padding: const EdgeInsets.only(),
        children: <Widget>[
          _drawerHeader(),
          IconButton(
              icon: Icon(
                Icons.account_balance,
                size: _size,
              ),
              onPressed: () {
                if (_counter == 0) {
                  _counter = 1;
                  _size = 30;
                } else {
                  _counter = 0;
                  _size = 25;
                }
              }),
          IconButton(
              icon: Icon(
                Icons.print,
                size: _size,
              ),
              onPressed: () {
                if (_counter == 0) {
                  _counter = 2;
                  _size = 30;
                } else {
                  _counter = 0;
                  _size = 25;
                }
              }),
        ],
      ),
    );
  }

  int _counter = 0;
  double _size = 25;

  static Widget _drawerHeader() {
    return new UserAccountsDrawerHeader(
//      margin: EdgeInsets.zero,
      accountName: new Text(
        "SuperLuo",
//        style: HStyle.titleNav(),
      ),
      accountEmail: new Text(
        "lll@163.com",
//        style: HStyle.bodyWhite(),
      ),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: NetworkImage("https://github.com/longtaozz/my_img/blob/master/my_img/IMG_20181231_121741.jpg?raw=true"),
      ),
      onDetailsPressed: () {},
      otherAccountsPictures: <Widget>[
        new CircleAvatar(
          backgroundImage: NetworkImage("https://github.com/longtaozz/my_img/blob/master/my_img/IMG_20181231_121741.jpg?raw=true"),
        ),
      ],
    );
  }

}

class tabBar extends StatelessWidget {
  final String tStr;
  tabBar({Key key, @required this.tStr}) : super(key: key);

  final List<Tab> myTabs = <Tab>[
    new Tab(text: '语文'),
    new Tab(text: '数学'),
    new Tab(text: '英语'),
    new Tab(text: '化学'),
    new Tab(text: '物理'),
    new Tab(text: '政治'),
    new Tab(text: '经济'),
    new Tab(text: '体育'),
  ];



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
      //默认的tabBar控制器，可以试用TabBar和TabBarView
      length: myTabs.length, //长度
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(
            tabs: myTabs,
            isScrollable: true,
          ),
        ),
        body: new TabBarView(
          children: myTabs.map((Tab tab) {
            return new Center(child: new Text(tab.text));
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            MRoute.goWidget(context, new Container3(cStr: "go3"));
          },
          child: new Text(tStr),
        ),
      ),
    );
  }
}
