import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeController extends GetxController{
  ScrollController scrollController=ScrollController();
  var page=1;
  var isMoreDataAvailadle=true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}