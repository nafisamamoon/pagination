import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mytests/shop-multi-user/apiresponse.dart';
import 'package:mytests/shop-multi-user/user-model.dart';
Future<ApiResponse> login(String email,String password)async{
ApiResponse apiResponse=ApiResponse();
print('////////////////////////////');
print(email);
print(password);
try{
  Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
final response=await http.post(
Uri.parse('http://192.168.37.189:8000/api/login'),
headers: {"Content-Type": "application/json"},
body:body
);
print("*****************");
print(response.body);
switch(response.statusCode){
  case 200:
  apiResponse.data=User.fromJson(jsonDecode(response.body));
  break;
  // case 422:
  // final errors=jsonDecode(response.body)['errors'];
  // apiResponse.error=errors[errors.keys.elementAt(0)][0];
  // break;
  // case 403:
  // apiResponse.error=jsonDecode(response.body)['message'];
  // break;
  
  
}
}catch(e){
apiResponse.error='error';
}
return apiResponse;
}