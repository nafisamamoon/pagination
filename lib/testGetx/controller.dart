import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mytests/testGetx/apires.dart';
import 'package:mytests/testGetx/data-services.dart';
import 'package:mytests/testGetx/model.dart';
import 'package:http/http.dart' as http;
//import 'package:get/state_manager.dart';
class PostController extends GetxController{
  ScrollController scrollController=ScrollController();
  var isMoreDataAvilable=true;
  var page=1;

   @override
 void onInit(){
  print('llll');
getPost(page);
paginateTask();
  }
  List posts=[];
    ApiResponse apiR=ApiResponse();
  getPost(page)async{
    var response=await DataServices().getposts(page);
   
      posts=response;
      print('****');
      print(posts);
    update();
  }
 void paginateTask(){
scrollController.addListener(() {
  if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
    print('bottom');
    page++;
    getMorePost(page);
  }
 });
 }
 List data=[];
 void getMorePost(var page)async{
 var response=await DataServices().getposts(page);
  data=response;
if(data.length > 0){
  isMoreDataAvilable=true;
}else{
  isMoreDataAvilable=false;
}
posts.addAll(data);
update();
 }
}