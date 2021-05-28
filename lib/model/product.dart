import 'package:flutter/material.dart';

class Product {
  final String title, info, description, image, company;
  final int id;
  final String productID;
  final int price;
  int quantity;

  Product(
      {@required this.productID,
      @required this.company,
      @required this.id,
      @required this.title,
      @required this.info,
      @required this.description,
      @required this.price,
      @required this.image,
      this.quantity = 1});
  // Increase and decrease quantity
  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}

List infoData = [
  Product(
      id: 1,
      title: 'Emzor',
      price: 500,
      info: 'Lorem Ipsum is Health Info',
      description: 'Tablet: 400gm',
      image: 'assets/images/image9.jpeg',
      productID: 'errfppo',
      company: 'Emzor Labs'),
  Product(
      id: 2,
      title: 'T-cup',
      price: 2500,
      info: 'Lorem Ipsum is Health Info',
      description: 'Oral Suspension: 300gm',
      image: 'assets/images/image2.jpeg',
      productID: 'llowwer',
      company: 'Star Labs'),
  Product(
      id: 3,
      title: 'Zolat',
      price: 1500,
      info: 'Lorem Ipsum is Health Info ',
      description: 'Oral Suspension: 200gm',
      image: 'assets/images/image3.jpeg',
      productID: 'pploiii',
      company: 'Star Pharmaceuticals'),
  Product(
      id: 4,
      title: 'Ez level',
      price: 550,
      info: 'Lorem Ipsum is Health Info',
      description: 'Tablet: 480gm',
      image: 'assets/images/image4.jpeg',
      productID: 'ppoormk',
      company: 'Orange Pharmaceuticals'),
  Product(
      id: 5,
      title: 'Folic Acid',
      price: 900,
      info: 'Lorem Ipsum is Health Info',
      description: 'Oral Suspension: 150gm',
      image: 'assets/images/image5.jpeg',
      productID: 'llopopi',
      company: 'B. Pharmaceuticals'),
  Product(
      id: 6,
      title: 'Identify ',
      price: 700,
      info: 'Lorem Ipsum is Health Info',
      description: 'Teblet: 200gm',
      image: 'assets/images/image6.jpeg',
      productID: 'mmnmbyt',
      company: 'WaterFall Labs'),
  Product(
      id: 7,
      title: 'Annabella',
      price: 600,
      info: 'Lorem Ipsum is Health Info',
      description: 'Oral Suspension: 100gm',
      image: 'assets/images/image7.jpeg',
      productID: 'okjhuop',
      company: 'Fyzer Pharmaceuticals'),
  Product(
      id: 8,
      title: 'Garlic ',
      price: 850,
      info: 'Lorem Ipsum is Health Info',
      description: 'Tablet: 350gm',
      image: 'assets/images/image8.jpeg',
      productID: 'llhgftt',
      company: 'Umbrella Cooperation'),
  Product(
      id: 9,
      title: 'Bayer',
      price: 6000,
      info: 'Lorem Ipsum is Health Info',
      description: 'Table: 450gm',
      image: 'assets/images/image.jpeg',
      productID: 'aawewaa',
      company: 'Kinsolve Labs'),
  Product(
      id: 10,
      title: 'Para1000',
      price: 750,
      info: 'Lorem Ipsum is Health Info',
      description: 'Oral Suspension: 120gm',
      image: 'assets/images/image10.jpeg',
      productID: 'qqrroop',
      company: 'Gabriel Industries'),
];
