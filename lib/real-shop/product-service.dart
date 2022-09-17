import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mytests/real-shop/apiresponse.dart';
import 'package:mytests/real-shop/cart-model.dart';
import 'package:mytests/real-shop/product-model.dart';
//get all products
Future<ApiResponse> getProducts()async{
  ApiResponse apiResponse=ApiResponse();
  try{
    
    final response=await http.get(
      Uri.parse('http://192.168.37.189:8000/api/products'),
      headers: {
        "Content-Type": "application/json",
      
      }
    );
   
    switch(response.statusCode){
      case 200:
      print('lol');
      apiResponse.data=jsonDecode(response.body)['products'].map((p)=>Product.fromJson(p)).toList();
      apiResponse.data as List<dynamic>;
      break;
      case 401:
       print('lol2');
      apiResponse.error='error';
      break;
    }
  }
  catch(e){
    apiResponse.error='error';
  }
  
  return apiResponse;
}
//add product to cart table
Future<ApiResponse> createPost(int? id)async{
  ApiResponse apiResponse=ApiResponse();
  try{
    final response=await http.post(
      Uri.parse('http://192.168.37.189:8000/api/addproducttocarttable/$id'),
      headers: {
         "Content-Type": "application/json",
      },
    );
    print('*************************');
  print(response.body);
    switch(response.statusCode){
      case 200:
        apiResponse.data=jsonDecode(response.body);
        break;
        // case 422:
        // final errors=jsonDecode(response.body)['errors'];
        // apiResponse.error=errors[errors.keys.elementAt(0)][0];
        // break;
        // case 401:
        // apiResponse.error='error';
        // break;
    }
  }catch(e){
    apiResponse.error='error';
  }
  return apiResponse;
}
//get all products in cart table
Future<ApiResponse> getProductsInCart()async{
  ApiResponse apiResponse=ApiResponse();
  try{
    
    final response=await http.get(
      Uri.parse('http://192.168.37.189:8000/api/carts'),
      headers: {
        "Content-Type": "application/json",
      
      }
    );
   
    switch(response.statusCode){
      case 200:
      print('lol');
      apiResponse.data=jsonDecode(response.body)['carts'].map((p)=>Cart.fromJson(p)).toList();
      apiResponse.data as List<dynamic>;
      break;
      case 401:
       print('lol2');
      apiResponse.error='error';
      break;
    }
  }
  catch(e){
    apiResponse.error='error';
  }
  print('success');
  return apiResponse;
}
//increase product quantity
Future<ApiResponse> increaseQuantity(int? id)async{
  ApiResponse apiResponse=ApiResponse();
  try{
    final response=await http.post(
      Uri.parse('http://192.168.37.189:8000/api/addproductquantity/$id'),
      headers: {
         "Content-Type": "application/json",
      },
    );
    
  print(response.body);
    switch(response.statusCode){
      case 200:
     
        apiResponse.data=jsonDecode(response.body);
        print(apiResponse.data);
        break;
    }
  }catch(e){
    print('error');
    apiResponse.error='error';
  }
  return apiResponse;
}
//decrease product quantity
Future<ApiResponse> decreaseproductquantity(int? id)async{
  ApiResponse apiResponse=ApiResponse();
  try{
    final response=await http.post(
      Uri.parse('http://192.168.37.189:8000/api/decreaseproductquantity/$id'),
      headers: {
         "Content-Type": "application/json",
      },
    );
    print('*************************');
  print(response.body);
    switch(response.statusCode){
      case 200:
      print('success');
        apiResponse.data=jsonDecode(response.body);
        break;
        // case 422:
        // final errors=jsonDecode(response.body)['errors'];
        // apiResponse.error=errors[errors.keys.elementAt(0)][0];
        // break;
        // case 401:
        // apiResponse.error='error';
        // break;
    }
  }catch(e){
    print('error');
    apiResponse.error='error';
  }
  return apiResponse;
}