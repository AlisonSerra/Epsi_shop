import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Product{
  String nom;
  String description;
  num prix;
  String image;
  String categorie;
  double note;

  Product(this.nom, this.description, this.prix, this.image, this.categorie, this.note);

  Product.fromJson(Map<String, dynamic> json)
    :nom= json['title'],
    description= json['description'],
    prix = json['price'],
    image= json['image'],
    categorie = json['category'],
    note = json['rating']['rate'];

  String displayPriceInEuro() => "$prix €";

  ratting(){
    return RatingBar.builder(
        initialRating: note.toDouble(),
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon (
          Icons.star,
          color: Colors.red,
        ),
        onRatingUpdate: (rating) {},
    );
  }
  }