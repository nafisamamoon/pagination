import 'package:flutter/material.dart';
import 'package:mytests/real-shop/apiresponse.dart';
import 'package:mytests/real-shop/cart-model.dart';
import 'package:mytests/real-shop/product-service.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({ Key? key }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<dynamic> _cartList=[];
Future<void> retriveCarts()async{
    ApiResponse response=await getProductsInCart();
    if(response.error == null){
      setState(() {
        _cartList=response.data as List<dynamic>;
        print('////////////////');
        print(_cartList.toString());
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
    retriveCarts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

        ],
      ),
      body: Column(
        children: [
          Container(
        height: 400,
        child: ListView.builder(
          itemCount: _cartList.length,
          itemBuilder: (context,i){
             Cart cart=_cartList[i];
             return ListTile(
              title: Text('${cart.name}'),
              subtitle:      IconButton(onPressed: ()async{
                ApiResponse response=await decreaseproductquantity(cart.product_id);
    if(response.error == null){
    print('win');
    setState(() {
      retriveCarts();
    });
    }else if(response.error == 'error'){
 print('error');
    }
    else{
    print('lose');
    }  
     
              }, icon: Icon(Icons.remove)),
              trailing: 
          
                  IconButton(onPressed: ()async{
                ApiResponse response=await increaseQuantity(cart.product_id);
    if(response.error == null){
    print('win');
    setState(() {
      retriveCarts();
    });
    }else if(response.error == 'error'){
 print('error');
    }
    else{
    print('lose');
    }  
              }, icon: Icon(Icons.add)),
              leading:Text('${cart.quantity}'),
             );
          }
          )
      ),
        ],
      ),
    );
  }
  
}