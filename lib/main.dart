import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    theme: new ThemeData(
      primaryColor: Colors.green,
    ),
    home: ShoppingList(
      products: <Product>[
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
      ],
    ),
  ));
}

class Product {
  const Product({this.name});
  final String name;
}

typedef CarChangedCallback(Product prd,bool inCart);

class ShoppingListItem extends StatelessWidget{
  
  ShoppingListItem({Product product, this.isCart, this.onCarChanged})
      : product = product,
        super(key: ObjectKey(product));
  final bool isCart;
  final CarChangedCallback onCarChanged;
  final Product product;

  Color _getColor(BuildContext context){
    return isCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context){
    if(!isCart) return null;
    
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
       onTap: (){
         onCarChanged(product,!isCart);
       },
       leading: CircleAvatar(
         backgroundColor: _getColor(context),
         child: Text(product.name[0]),
       ),
       title: Text(
         product.name[0],
         style: _getTextStyle(context),
         ),
    );
  }

}


class ShoppingList extends StatefulWidget{
  ShoppingList({this.products,Key key}) : super(key:key);
  final List<Product> products;
  
  @override
  State<StatefulWidget> createState() => _ShoppingState();
}

class _ShoppingState extends State<ShoppingList>{
   Set<Product> productions = Set<Product>();

   void _handleShopCartEvent(Product product,bool isInCar){
      setState(() {
         if(isInCar) 
          productions.add(product);
        else 
          productions.remove(product); 
      });
   }

   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping list'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(),
        children: widget.products.map((Product product){
          return ShoppingListItem(
            product: product,
            isCart: productions.contains(product),
            onCarChanged: _handleShopCartEvent,
          ) ;
        }).toList(),
      ),
    );
  }

}
