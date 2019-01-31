import 'package:flutter/material.dart';
import 'package:banner_view/banner_view.dart';
import 'package:flutter_demo/bean/main_mid.dart';
import 'package:flutter_demo/util/toast.dart';
import 'package:flutter_demo/util/ToolsUtil.dart';

import 'dart:async';

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
//  data.add(['最热', '	湖南省人民政府关于废止和修改部分省人民政府规章的决定']);
  data.add(['最火', '湖南省基本医疗保险监督管理办法']);
  return data;
}


//
//class xxxx extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Row(
//      children: <Widget>[
//        Container(width:MediaQuery.of(context).size.width,child: new midG(),)
//    ],);
//  }
//}
//
////中间按钮
//class midG extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return midGState();
//  }
//}
//
//List<MidData> getmidData() {
//  List<MidData> m = new List();
//  //模拟数据
//  m.add(new MidData(0, Icons.call, "打电话", Colors.blue));
//  m.add(new MidData(1, Icons.account_circle, "电话本", Colors.blue));
//  m.add(new MidData(2, Icons.wifi_lock, "关闭wifi", Colors.blue));
//  m.add(new MidData(3, Icons.wifi, "打开wifi", Colors.blue));
//  m.add(new MidData(4, Icons.volume_down, "音量加", Colors.blue));
//  m.add(new MidData(5, Icons.volume_mute, "音量减", Colors.blue));
//  return m;
//}
//
//class midGState extends State<midG> {
//  List<MidData> ll = getmidData();
//  var _midData;
//
//  void _onclicMid(var id) {
//    setState(() {
//      for (MidData mid in ll) {
//        if (mid.id == id) {
//          if (mid.color == Colors.blue) {
//            mid.color = Colors.white;
//          } else {
//            mid.color = Colors.blue;
//          }
//        }
//      }
//      _midData = id;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return main_mid(ll, _midData);
//  }
//
//  Widget main_mid(List<MidData> midData, int id) {
//    return GridView.count(
//      crossAxisCount: 5,
//      children: midData
//          .map((data) => Container(
//                child: Center(
//                  child: GestureDetector(
//                    onTap: () {
//                      print(data.id);
//                      _onclicMid(data.id);
//                    },
//                    child: Column(
//                      children: <Widget>[
//                        Icon(
//                          data.img,
//                          color: data.color,
//                        ),
//                        Text(
//                          data.name,
//                          style: TextStyle(
//                              fontSize: 13,
//                              color: data.color,
//                              decoration: TextDecoration.none),
//                        )
//                      ],
//                    ),
//                  ),
//                ),
//              ))
//          .toList(),
//    );
//  }
//}

//class HomePage extends StatefulWidget {
//  @override
//  HomePageState createState() {
//    return new HomePageState();
//  }
//}
//
//class HomePageState extends State<HomePage> {
//  var url =
//      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
//
//  PokeHub pokeHub;
//
//  @override
//  void initState() {
//    super.initState();
//    fetchData();
//  }
//
//  fetchData() async {
//    var res = await http.get(url);
//    var decodedJson = jsonDecode(res.body);
//    pokeHub = PokeHub.fromJson(decodedJson);
//    print(pokeHub.toJson());
//    setState(() {});
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Poke App"),
//        backgroundColor: Colors.cyan,
//      ),
//      body: pokeHub == null
//          ? Center(
//              child: CircularProgressIndicator(),
//            )
//          : GridView.count(
//              crossAxisCount: 2,
//              children: pokeHub.pokemon
//                  .map((poke) => Padding(
//                        padding: const EdgeInsets.all(2.0),
//                        child: InkWell(
//                          onTap: () {
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => PokeDetail(
//                                          pokemon: poke,
//                                        )));
//                          },
//                          child: Hero(
//                            tag: poke.img,
//                            child: Card(
//                              child: Column(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceEvenly,
//                                children: <Widget>[
//                                  Container(
//                                    height: 100.0,
//                                    width: 100.0,
//                                    decoration: BoxDecoration(
//                                        image: DecorationImage(
//                                            image: NetworkImage(poke.img))),
//                                  ),
//                                  Text(
//                                    poke.name,
//                                    style: TextStyle(
//                                      fontSize: 20.0,
//                                      fontWeight: FontWeight.bold,
//                                    ),
//                                  )
//                                ],
//                              ),
//                            ),
//                          ),
//                        ),
//                      ))
//                  .toList(),
//            ),
//      drawer: Drawer(),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {},
//        backgroundColor: Colors.cyan,
//        child: Icon(Icons.refresh),
//      ),
//    );
//  }
//}
