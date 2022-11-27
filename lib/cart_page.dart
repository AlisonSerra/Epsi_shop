import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    CartModel _cartProduct = context.watch<CartModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Panier Epsi Shop"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              if ( _cartProduct.getCount() == 1)
                Text(
                  "Votre panier contient  ${_cartProduct.getCount()}  élément",
                  style: Theme.of(context).textTheme.headline6,
                ),
              if ( _cartProduct.getCount() > 1)
                Text(
                  "Votre panier contient  ${_cartProduct.getCount()}  éléments",
                  style: Theme.of(context).textTheme.headline6,
                ),
              Expanded(child:
                ListView.builder(
                  itemCount: _cartProduct.getCount(),
                  itemBuilder: (context, index) =>
                  ListTile(
                    leading: Image.network(
                      _cartProduct.getProducts()[index].image,
                      width: 80, height: 80,),
                    title: Text(_cartProduct.getProducts()[index].nom),
                    subtitle: Text(
                      _cartProduct.getProducts()[index].displayPriceInEuro(),
                      style: TextStyle(color: Colors.teal),
                    ),
                    trailing: IconButton(onPressed: () {
                      "${_cartProduct.remove(_cartProduct.getProducts()[index])}";
                      }, icon: const Icon(Icons.delete)),
                  ),
                ),
              ),
              if (_cartProduct.getCount() == 0)
                Text(
                  "Vous avez aucun article dans votre panier",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Spacer(),
              if (_cartProduct.getCount() >= 1)
                Text("Votre panier total est de : ${context.watch<CartModel>().getSum()}  €"),

            ]
          ),
        ),
      ),
    );
  }
}
