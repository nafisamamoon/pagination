import 'package:flutter/material.dart';
import 'package:mytests/pagination/pagen/ho.dart';
import 'package:mytests/pagination/pagen/tt.dart';
import 'package:mytests/pagination/paginate.dart';
import 'package:mytests/real-shop/product-screen.dart';
import 'package:mytests/shop/all-product.dart';
import 'package:mytests/testGetx/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     // home: AllProduct(),
     //for real shop
    //  home: ProductScreen(),
    //work paginate
    // home: TT(),
    home: Home(),
    );
  }
}

