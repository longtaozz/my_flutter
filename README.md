# my_flutter
视觉由很多widget构建
基本组件
Container（一个拥有绘制、定位、调整大小的容器）
Row（行，就是横向排列）
Column（列，就是竖向排列）
Image（字面意思，就是图片容器）
Text（文本）
Icon（图标）
RaisedButton（按钮，一种有效果的按钮，凸起的）
Scaffold（布局的基本实现）
appBar（程序栏）
FlutterLogo（logo，widget形式，遵循IconThem）
Placeholder（一个绘制了一个盒子的widget）



Container（容器）
容器，一个常用的控件，由基本的绘制、位置和大小控件组成。负责创建矩形的可视元素，可以用BoxDecoration来设计样式，比如背景、边框和阴影，Container也有边距、填充和大小限制，另外，还可以在三维空间利用矩阵进行变换。
没有约束和子控件的容器是无限大的，有子控件或约束以后会尽可能的缩小
如：无限大


看构造

只要一一了解容器构造参数就差不多了

Alignment（定位）

用于控件绘制定位，通过相对横纵坐标将控件放置在盒子里

Alignment继承自AlignmentGeometry


Child（小部件）

控件容器，如果不设置子属性（row,column,stack），这个小容器只能容纳一个控件

Constraints（约束）

通过BoxConstraints约束容器大小，优先级大于直接设置大小（height，width）


Decoration（背景装饰）

设置边框、背景色、背景图片、圆角等属性，图片变换。这种图片变换和位置无关，只是绘制改变，还是在原来的位置
Decoration和color不能同时设置，背景色需要在decoration中设置

BoxDecoration继承自Decoration


ForegroundDecoration（前景）

和它兄弟decoration差不多，区别在与它是前景，是会遮盖住容器内容的，所以一般用来写透明层，使用和decoration一样都是用BoxDecoration设置属性


Margin，padding这些就算了。

Transfrom（变化转换）
图片变化旋转，比较复杂下面再讲，写个

一些Matrix4用法可以看源码


Key（可选属性，额，不知道有什么用，翻译下官方的解释，）
key用于控制控件如何取代树中的另一个控件.
如果2个控件的runtimeType和key属性operator==, 那么新的控件通过更新底层元素来替换旧的控件(通过调用Element.update). 否则旧的控件将从树上删除, element会生成新的控件, 然后新的element会被插入到树中.
另外, 使用GlobalKey做为控件的key, 允许element在树周围移动(改变父节点), 而不会丢失状态. 当发现一个新的控件时(它的key和类型与同一位置上控件不匹配), 但是在前面的结构中有一个带有相同key的小部件, 那么这个控件将会被移动到新的位置.
GlobalKey是很昂贵的. 如果不需要使用上述特性, 可以考虑使用Key, ValueKey或UniqueKey替换.
通常, 只有一个子节点的widget不需要指定key.

Expa（填充组件）
一个非常有用的组件，用来填充组件（如row，column等排列组件）剩余部分，
Expanded组件必须用在Row、Column、Flex内，并且从Expanded到封装它的Row、Column、Flex的路径必须只包括StatelessWidgets或StatefulWidgets组件(不能是其他类型的组件，像RenderObjectWidget，它是渲染对象，不再改变尺寸了，因此Expanded不能放进RenderObjectWidget)。

填充其余控件没用到的部分


Row（水平）
这个东西和LinearLayout一样的，垂直布局
构建：


mainAxisSize（主轴大小）
看构造可以知道，默认为max

MainAxisAlignment（主轴对齐方式）
看源码吧，不多解释，默认为center
center：将children放置在主轴的中心；
end：将children放置在主轴的末尾；
spaceAround：将主轴方向上的空白区域均分，使得children之间的空白区域相等，但					是首尾child的空白区域为1/2；
spaceBetween：将主轴方向上的空白区域均分，使得children之间的空白区域相等，首					尾child都靠近首尾，没有间隙；
spaceEvenly：将主轴方向上的空白区域均分，使得children之间的空白区域相等，包括				首尾child；
start：将children放置在主轴的起点；

textDirection（设置列表显示顺序）
只有两个属性ltr，rtl（顺序，逆序）

textBaseline（不知道干嘛）

VerticalDirection（这也不知道，没试出效果）

Column（垂直）
构造都一样，
Image（图片部件）

图片展示部件，不多说，看构造源码

多了一个新单词@required，在dart中为必填参数的意思

Image（加载图片，必填属性）

一个有网络图片加载框架的控件，有四种加载方式，先知道他的用法，有时间再查看细细探究


semanticLabel（语义描述）

用于向Andoid上的TalkBack和iOS上的VoiceOver提供图像描述
	semanticLabel: "网络图片2",//和excludeFromSemantics配合使用


excludeFromSemantics（是否开启语义描述）

和semanticLabel配合使用
	excludeFromSemantics: true,//但是好像也没效果（可能是手机版本太低）

width、height（宽，高）

Color（颜色）

需要和colorBlendMode配合使用，不然他就是设置背景颜色，且覆盖掉图片

colorBlendMode（颜色混合模式）

需要和color配合使用，单独使用无效果BlendMode模式看源码

	color: Colors.purple,
	colorBlendMode: BlendMode.colorBurn,//颜色加深

Fit（图片显示方式）

加载图片的适应方式，属性看源码
	fit: BoxFit.fitHeight,//合适的高度，原图按高度缩放的意思

BoxFit.fill
图片按照指定的大小在Image中显示，拉伸显示图片，不保持原比例，填满Image

BoxFit.contain
以原图正常显示为目的，如果原图大小大于Image的size，就按照比例缩小原图的宽高，居中显示在Image中。如果原图size小于Image的size，则按比例拉升原图的宽和高，填充Image一边并居中显示。

BoxFit.cover
以原图填满Image为目的，如果原图size大于Image的size，按比例缩小，居中显示在Image上。如果原图size小于Image的size，则按比例拉升原图的宽和高，填充Image居中显示。

BoxFit.fitWidth
以原图正常显示为目的，如果原图宽大小大于（小于）Image的宽，就缩小（放大）原图的宽与Image一致，居中显示在Image中。

BoxFit.fitHeight
以原图正常显示为目的，如果原图高大小大于（小于）Image的高，就缩小（放大）原图的高与Image一致，居中显示在Image中。

BoxFit.none
保持原图的大小，显示在Image的中心。当原图的size大于Image的size时，多出来的部分被截掉

BoxFit.scaleDown        
以原图正常显示为目的，如果原图大小大于Image的size，就按照比例缩小原图的宽高，居中显示在Image中。如果原图size小于Image的size，则不做处理居中显示图片。 


Repeat（覆盖，重复）

就是设置剩余部分的使用（和Fit冲突，设置Fit的话这个就没效果）
//            fit: BoxFit.fitHeight,//合适的高度，原图按高度缩放的意思
            repeat: ImageRepeat.repeatX,//横向平铺，与fit冲突

centerSlice（中心拉伸）
            
//实现android中的9官图效果，然而~
            centerSlice: Rect.fromLTRB(100, 100, 100, 100),

matchTextDirection（匹配文字显示方向）

按照文字设置顺序（上面说过TextDirection），设置图片的方向，不过要包裹在Directionality中才有效
new Directionality(
  textDirection: TextDirection.rtl,
  child: Image(
image: new NetworkImage(
      "http://pic28.photophoto.cn/20130818/0020033183970083_b.jpg"),
matchTextDirection: true,//开启文字绘制方向
)

filterQuality（滤镜级别）
默认中等，试了几个级别，好像没发现什么区别，可能是眼睛不好吧
	filterQuality: FilterQuality.high,//滤镜级别,高（然而~）


Text（文本）

看源码构造：
const Text(this.data, {
  Key key,
  this.style,
  this.textAlign,
  this.textDirection,
  this.locale,
  this.softWrap,
  this.overflow,
  this.textScaleFactor,
  this.maxLines,
  this.semanticsLabel,
})

Data（内容）

Style（样式）
设置内容的样式。使用TextStyle。
TextStyle：
const TextStyle({
  this.inherit = true,
  this.color,
  this.fontSize,
  this.fontWeight,
  this.fontStyle,
  this.letterSpacing,
  this.wordSpacing,
  this.textBaseline,
  this.height,
  this.locale,
  this.foreground,
  this.background,
  this.shadows,
  this.decoration,
  this.decorationColor,
  this.decorationStyle,
  this.debugLabel,
  String fontFamily,
  String package,
}

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

textAlign（文字对齐方式）

	textAlign: TextAlign.right,//文字的对齐方向，此为向右对齐

Locale（区域设置）

	locale: Locale("dasdad"),//和style的有什么区别？？？覆盖么？

SoftWrap（自动换行）

	softWrap: false,//自动换行，false不换，默认为换行

Overflow（溢出处理）

文字占满后的处理。消失和省略号等，看源码
	overflow: TextOverflow.fade,//溢出处理，消失



Icon（图标）
构建图标，图标不可交互，直接看构造
const Icon(this.icon, {
  Key key,
  this.size,
  this.color,
  this.semanticLabel,
  this.textDirection,
})

Icon（第一个参数，this.icon）
# The following line ensures that the Material Icons font is included with your application, so that you can use the icons in the material Icons class.（下面一行确保应用程序中包含了Material Icons字体，以便您可以在Material Icons类中使用图标。）

  uses-material-design: true
如new Icon(Icons.arrow_back,..)

其他参数（比较简单，一起写了）

new Icon(Icons.arrow_back,
  size: 20,//大小
  color: Colors.red,//颜色
  semanticLabel: "红色雪花",//渲染图标的方向,需要源码图标里能设置方向的，就是有matchTextDirection: true);的，如arrow_back
  textDirection: TextDirection.rtl,
)

ImageIcon（自定义图标）
自定义图标，也是不能交互的

ImageIcon(new NetworkImage("http://pic28.photophoto.cn/20130818/0020033183970083_b.jpg"),
  size: 120,//大小
  color: Colors.black26,//颜色
  semanticLabel: "红色雪花",//帮助盲人或者视力有障碍的用户提供语言辅助描述
)

IconButton（图标按钮）
图标按钮，可交互的，看构造源码
const IconButton({
  Key key,
  this.iconSize = 24.0,
  this.padding = const EdgeInsets.all(8.0),
  this.alignment = Alignment.center,
  @required this.icon,
  this.color,
  this.highlightColor,
  this.splashColor,
  this.disabledColor,
  @required this.onPressed,
  this.tooltip
}

必填参数icon,onPressed
Icon:不要上面
onPressed:事件

效果
IconButton(icon: new Icon(Icons.ac_unit,color: Colors.red,), onPressed: (){print("点击了");},//点击事件
  //size，alignment不写了
  padding: new EdgeInsets.all(30),//边距,点击范围没有随之扩大
  color: Colors.blue,//在icon没有设置color时有效，icon里设置color优先级大写
  highlightColor: Colors.purple,//高光颜色，点击颜色
  splashColor: Colors.amber,//飞溅颜色，点击的扩张颜色
  disabledColor: Colors.teal,//没试出效果
  tooltip: "您点击了~",//提示框，在长按两秒左右会弹出一个类似android Toast的框
)

RaisedButton（凸起的按钮）

就是一个按钮，直接看构造
const RaisedButton({
  Key key,
  @required VoidCallback onPressed,
  ValueChanged<bool> onHighlightChanged,
  ButtonTextTheme textTheme,
  Color textColor,
  Color disabledTextColor,
  Color color,
  Color disabledColor,
  Color highlightColor,
  Color splashColor,
  Brightness colorBrightness,
  double elevation,
  double highlightElevation,
  double disabledElevation,
  EdgeInsetsGeometry padding,
  ShapeBorder shape,
  Clip clipBehavior = Clip.none,
  MaterialTapTargetSize materialTapTargetSize,
  Duration animationDuration,
  Widget child,
})

也有一个必填点击回调，上面有

Shape（外形）
主要讲下这个，外形，经常用到，比如圆角之类的
1、首先看这个参数需要什么
	ShapeBorder shape,
他需要一个ShapeBorder，点进去看下
	@immutable
	abstract class ShapeBorder {
他是一个抽象类，在看看他的静态方法
	lerp(ShapeBorder a, ShapeBorder b, double t)
这类的不会用啊。。
找他的子类

有那么都，随便找个（我找个圆角的）
const RoundedRectangleBorder({
  this.side = BorderSide.none,
  this.borderRadius = BorderRadius.zero,
})
最后使用

shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    side: BorderSide(
        color: Color(0xFF342500),
        style: BorderStyle.solid,
        width: 1)), //外形，RoundedRectangleBorder：圆角


其他的就稍微用下统一写在这里

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
          width: 1)), //外形，RoundedRectangleBorder：圆角
  clipBehavior: Clip.antiAlias,//剪辑，antiAlias：抗锯齿
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,//没什么效果，懒得管了
  animationDuration: Duration(seconds: 2),//动画周期
),

Scaffold（脚手架）
视图，还不太理解，类似于activit的子类吧，带一定特殊布局的activity
看源码吧
const Scaffold({
  Key key,
  this.appBar,
  this.body,
  this.floatingActionButton,
  this.floatingActionButtonLocation,
  this.floatingActionButtonAnimator,
  this.persistentFooterButtons,
  this.drawer,
  this.endDrawer,
  this.bottomNavigationBar,
  this.bottomSheet,
  this.backgroundColor,
  this.resizeToAvoidBottomPadding = true,
  this.primary = true,
})

AppBar（导航栏）
显示在顶部的appBar，和原生的appbar一个概念
AppBar({
  Key key,
  this.leading,
  this.automaticallyImplyLeading = true,
  this.title,
  this.actions,
  this.flexibleSpace,
  this.bottom,
  this.elevation = 4.0,
  this.backgroundColor,
  this.brightness,
  this.iconTheme,
  this.textTheme,
  this.primary = true,
  this.centerTitle,
  this.titleSpacing = NavigationToolbar.kMiddleSpacing,
  this.toolbarOpacity = 1.0,
  this.bottomOpacity = 1.0,
})

Leding：左边的按钮，一般都是返回什么的

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

Bottom：导航栏下面的标签
需要一个PreferredSize
const PreferredSize({
  Key key,
  @required this.child,
  @required this.preferredSize,
})

Child:布局
PreferredSize：大小
bottom: PreferredSize(
      child: new Row(
        children: <Widget>[Text("one"), Text("Tuo"), Text("three")],//布局
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      preferredSize: Size(0, 10)),//大小
),

其它属性

elevation: 10, //高度。其实就是用阴影给人立体的高度
backgroundColor: Colors.pink,//背景颜色
brightness: Brightness.light,//亮度
iconTheme: IconThemeData(color: Colors.black,opacity: 0.9),//改变图标颜色，透明度，大小
textTheme: TextTheme(display1: TextStyle(color: Colors.blue)),//太复杂，而且感觉没什么用
primary: true,//设置导航栏的内容是否无视手机的导航栏
centerTitle: true,//导航标题是否居中
titleSpacing: 99,//不知道怎么用
toolbarOpacity: 0.5,//标题透明度。
bottomOpacity: 0.5,//底部标题透明度
