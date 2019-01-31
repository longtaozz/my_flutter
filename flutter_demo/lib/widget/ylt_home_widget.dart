import 'package:flutter/material.dart';
import 'package:banner/banner.dart';
import 'package:flutter_demo/bean/main_mid.dart';
import 'package:flutter_demo/util/ToolsUtil.dart';

//banner
Widget main_banner() {
  return new Container(
    alignment: Alignment.topCenter,
    height: 200.0,
    child: BannerView(
      scrollTime: 500,
      height: 200.0,
      data: [
        Image.network(
          'https://github.com/longtaozz/my_img/blob/master/my_img/20190116112259.jpg?raw=true',
        ),
        Image.network(
          'https://github.com/longtaozz/my_img/blob/master/my_img/20190116112259.jpg?raw=true',
          fit: BoxFit.contain,
        ),
        Image.network(
          'https://github.com/longtaozz/my_img/blob/master/my_img/20190116112259.jpg?raw=true',
        )
      ],
      buildShowView: (index, data) {
        print(data);
        return data;
      },
      onBannerClickListener: (index, data) {
        print(index);
      },
    ),
  );
}

//中间按钮
class midG extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return midGState();
  }
}

List<MidData> getmidData() {
  List<MidData> m = new List();
  //模拟数据
  m.add(new MidData(id: 0, img: Icons.call, name: "打电话", color: Colors.blue));
  m.add(new MidData(
      id: 1, img: Icons.account_circle, name: "电话本", color: Colors.blue));
  m.add(new MidData(
      id: 2, img: Icons.wifi_lock, name: "关闭wifi", color: Colors.blue));
  m.add(
      new MidData(id: 3, img: Icons.wifi, name: "打开wifi", color: Colors.blue));
  m.add(new MidData(
      id: 4, img: Icons.volume_down, name: "音量加", color: Colors.blue));
  m.add(new MidData(
      id: 5, img: Icons.volume_mute, name: "音量减", color: Colors.blue));
  return m;
}

class midGState extends State<midG> {
  List<MidData> ll = getmidData();
  var _midData;

  void _onclicMid(var id) {
    setState(() {
      for (MidData mid in ll) {
        if (mid.id == id) {
          if (mid.color == Colors.blue) {
            mid.color = Colors.black45;
          } else {
            mid.color = Colors.blue;
          }
        }
      }
      _midData = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return main_mid(ll, _midData);
  }

  Widget main_mid(List<MidData> midData, int id) {
    return Container(
      padding: EdgeInsets.all(0),
      height: double.maxFinite, //刚好适应控件的最大尺寸
      child: GridView.count(
        padding: EdgeInsets.all(0),
        crossAxisCount: 5,
        children: midData
            .map((data) => Container(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        print(data.id);
                        _onclicMid(data.id);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            data.img,
                            color: data.color,
                          ),
                          Text(
                            data.name,
                            style: TextStyle(
                                fontSize: 13,
                                color: data.color,
                                decoration: TextDecoration.none),
                          )
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

Widget advertising(BuildContext context) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Container(
        child: Image.asset("assets/images/loginbj_min.jpg", fit: BoxFit.fill),
        width: 100,
        height: 100,
        padding: EdgeInsets.only(right: 10),
      ),
      Expanded(
        child: Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: coll(),
        ),
      ),
    ],
  );
}

Widget coll() {
  return carrousel(collWidget(), 0, new Duration(seconds: 3), 200.0,
      axis: Axis.vertical);
}

Widget collWidget() {
  List colldata = getdata();
  return Container(
    color: Colors.white,
    child: Column(
      children: colldata
          .map((data) => Container(
                padding: EdgeInsets.only(top: 10),
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.orangeAccent,
                      child: Text(
                        data[0],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                            decoration: TextDecoration.none),
                      ),
                    ),
                    new Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          data[1],
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    ),
  );
}

List getdata() {
  List data = new List();
  data.add(['最火', '淘宝网是中国深受欢迎的网购零售平台']);
  data.add(['最火', '湖南省科学技术奖励办法']);
  data.add(['最热', '湖南省实施《自然灾害救助条例》办法']);
  data.add(['最火', '湖南省农村消防安全管理若干规定']);
  data.add(['最热', '	湖南省人民政府关于废止和修改部分省人民政府规章的决定']);
  data.add(['最火', '湖南省基本医疗保险监督管理办法']);
  return data;
}
