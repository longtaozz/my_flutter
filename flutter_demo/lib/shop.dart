import 'package:flutter/material.dart';

class Product {
  final String name;

  const Product({this.name});
}

typedef void CartChangedCallback(Product product, bool incat);

class sShoppingListItem extends StatelessWidget {
  final Product product;
  final bool incat;
  final CartChangedCallback onCartChanged;

  sShoppingListItem({Product product, this.incat, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));

  Color _color(BuildContext context) {
    return incat ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _textStyle(BuildContext context) {
    if (!incat) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      onTap: () {
        onCartChanged(product, !incat);
      },
      leading: new CircleAvatar(
        backgroundColor: _color(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(
        product.name,
        style: _textStyle(context),
      ),
    );
  }
}

class shopList extends StatefulWidget {
  final List<Product> products;

  shopList({Key key, this.products}) : super(key: key);

  shopListStyle createState() => new shopListStyle();

}

// ignore: type_argument_not_matching_bounds
class shopListStyle extends State<shopList>{

  Set<Product> _shopSet=new Set<Product>();

  void hadleCheng(Product product,bool incat){
    setState(() {
      if(incat){
        _shopSet.add(product);
      }else{
        _shopSet.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("my shop"),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product){
          return new sShoppingListItem(
            product: product,
            incat: _shopSet.contains(product),
            onCartChanged: hadleCheng,
          );
        }).toList(),
      ),
    );
  }

}
