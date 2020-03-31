import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ShoppingList(
      <Product>[
        new Product('Eggs'),
        new Product( 'Flour'),
        new Product('Chocolate chips')
      ]
      ),
    );
  }
}

class Product {
  final String name;
  Product(this.name);
}

//typedef 接口
typedef void CartChangedCallback(Product product, bool inCart);

/// 购物车条目
class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback callback;

  ShoppingListItem(this.product, this.inCart, this.callback);

  /// 颜色
  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  ///字体样式
  TextStyle _getTextStyle(BuildContext context) {
    return inCart
        ? new TextStyle(
            color: Colors.black54, decoration: TextDecoration.lineThrough)
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        // ignore: unnecessary_statements
       callback(product, !inCart);
        print('onTap--$inCart');
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name),
      ),
      title: new Text(product.name, style: _getTextStyle(context)),
    );
  }
}

class ShoppingList extends StatefulWidget {
  final List<Product> _list;

  ShoppingList(this._list);

  @override
  State<StatefulWidget> createState() {
    return new _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _set = new Set();

  void _handleCartChanged(Product product, bool inCraft) {
   setState(() {
     if (inCraft) {
       _set.add(product);
     } else {
       _set.remove(product);
     }
   });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List'),
      ),
      body: new ListView(
        padding: EdgeInsets.all(10),
        children: widget._list.map((Product product) {
          return new ShoppingListItem(
              product, _set.contains(product), _handleCartChanged);
        }).toList(),
      ),
    );
  }
}
