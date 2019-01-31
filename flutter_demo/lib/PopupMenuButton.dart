import 'package:flutter/material.dart';

class pop extends StatefulWidget{
  @override
  _popState createState() => new _popState();
}
enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _popState extends State<StatefulWidget>{
  WhyFarther _selection = WhyFarther.harder;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PopupMenuButton<WhyFarther>(
      onSelected: (WhyFarther result) { setState(() { _selection = result; }); },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.harder,
          child: Text('Working a lot harder'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.smarter,
          child: Text('Being a lot smarter'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.selfStarter,
          child: Text('Being a self-starter'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.tradingCharter,
          child: Text('Placed in charge of trading charter'),
        ),
      ],
    );
  }

}