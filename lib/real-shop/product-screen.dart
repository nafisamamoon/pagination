import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mytests/real-shop/apiresponse.dart';
import 'package:mytests/real-shop/cart-screen.dart';
import 'package:mytests/real-shop/product-model.dart';
import 'package:mytests/real-shop/product-service.dart';
class ProductScreen extends StatefulWidget {
  const ProductScreen({ Key? key }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
 List<dynamic> _postList=[];
Future<void> retrivePosts()async{
    ApiResponse response=await getProducts();
    if(response.error == null){
      setState(() {
        _postList=response.data as List<dynamic>;
        print('////////////////');
        print(_postList.length);
      });
    }else if(response.error == 'ERROR'){
print('error1');
    }
    else{
    print('error2');
    }
  }
    @override
  void initState() {
    retrivePosts();
  // allProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        height: 600,
        child: ListView.builder(
          itemCount: _postList.length,
          itemBuilder: (context,i){
             Product product=_postList[i];
             return ListTile(
              title: Text('${product.name}'),
              subtitle:  Text('${product.price}'),
              trailing: TextButton(
                onPressed: ()async{
    ApiResponse response=await createPost(product.id);
    if(response.error == null){
    print('win');
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
    }else if(response.error == 'error'){
 print('error');
    }
    else{
    print('lose');
    }  
                }, 
                child: Text('add To Cart')
                )
             );
          }
          )
      ),
    );
  }
}
// class Product{
//   final int id,price;
//   final String name;
//   Product(this.id,this.name,this.price);
// }