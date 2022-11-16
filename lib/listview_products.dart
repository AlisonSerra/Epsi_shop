
import 'package:flutter/material.dart';
import 'package:epsi_shop/product_modele.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';

class ListViewProducts extends StatelessWidget {
  const ListViewProducts({
    Key? key,
    required List<Product> listProducts,
  }) : _lsProducts = listProducts, super(key: key);

  final List<Product> _lsProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _lsProducts.length,
        itemBuilder: (context, index) =>
            ListTile(
              onTap: (){
                context.go("/detail", extra: _lsProducts[index]);
              },
              title: Text(_lsProducts[index].nom),
              subtitle: Text(
                  _lsProducts[index].displayPriceInEuro(),
                style: TextStyle(color: Colors.teal),
              ),
              leading: Hero(
                tag: _lsProducts[index].nom,
                child: Image.network(_lsProducts[index].image),
              ),
              trailing: TextButton(child: const Text("Add"),
                onPressed: () {
                  context.read<CartModel>().add(_lsProducts[index]);
                },
                style: TextButton.styleFrom(
                  primary: Colors.amber
                ),
              ),
            )
    );
  }
}