import 'package:flutter/cupertino.dart';
import 'product_modele.dart';

class CartModel extends ChangeNotifier{
  List<Product> _lsProducts = [];
  add(Product product){
    _lsProducts.add(product);
    notifyListeners();
  }
  remove(Product product){
    _lsProducts.remove(product);
    notifyListeners();
  }
  getProducts() => _lsProducts;
  getCount() => _lsProducts.length;
  getSum(){
    num sum = 0;
    for (var product in _lsProducts) {
      sum += product.prix;
    }
    return sum;
  }
}