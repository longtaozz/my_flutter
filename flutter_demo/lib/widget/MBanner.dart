import 'package:flutter/material.dart';
import 'package:banner_view/banner_view.dart';

Widget bannerX() {
  return new Container(
    alignment: Alignment.center,
    height: 200.0,
    child: new BannerView(
      ws(),
      initIndex: ws().length,
      indicatorMargin: 10,
      indicatorBuilder: (context, indicator) {
        Widget cc = new Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.center,
            padding: new EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            height: 40.0,
            width: double.infinity,
            color: Colors.transparent,
            child: indicator,
          ),
        );
        return new Opacity(
          opacity: 0.5,
          child: cc,
        );
      },
      indicatorSelected: new Container(
        width: 15.0,
        height: 5.0,
        decoration: new BoxDecoration(
          color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.all(
            new Radius.circular(5.0),
          ),
        ),
      ),
      indicatorNormal: new Container(
        width: 5.0,
        height: 5.0,
        decoration: new BoxDecoration(
          color: Colors.green,
          shape: BoxShape.rectangle,
        ),
      ),
      onPageChanged: (c){
//        print(c);
      },
      log: false,
    ),
  );
}

List<Widget> ws() {
  List<Widget> c = new List();
  c.add(Image.network(
    'https://github.com/longtaozz/my_img/blob/master/my_img/20190116112259.jpg?raw=true',
  ));
  c.add(Image.network(
    'https://github.com/longtaozz/my_img/blob/master/my_img/20190116112259.jpg?raw=true',
  ));
  c.add(Image.network(
    'https://github.com/longtaozz/my_img/blob/master/my_img/20190116112259.jpg?raw=true',
  ));
  return c;
}