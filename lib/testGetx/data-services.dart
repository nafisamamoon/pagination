// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:mytests/testGetx/model.dart';
// class DataServices{
//   var url=Uri.parse('https://jsonplaceholder.typicode.com/posts');
//   Future<List<Post>> getposts()async{
//     var response=await http.get(url);
//     return postFromJson(response.body);
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mytests/testGetx/apires.dart';
import 'package:mytests/testGetx/model.dart';

class DataServices{
  ApiResponse apiR=ApiResponse();
  var url='http://192.168.30.189:8000/api/books';
 getposts(page)async{
  print('llll');
  var data;
  var data1;
    var response=await http.get(Uri.parse('$url?page=$page'));
   if(response.statusCode ==200){
apiR.data=jsonDecode(response.body)['data'].map((p)=>Post.fromJson(p)).toList();
// data1=data as List<dynamic>;
   }

    print('////////');
    print(apiR.data);
  return apiR.data;
   
  }
}
