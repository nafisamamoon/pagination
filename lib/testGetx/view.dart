import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytests/testGetx/controller.dart';
import 'package:mytests/testGetx/model.dart';
class Home extends StatelessWidget {
  //const Home({ Key? key }) : super(key: key);
PostController controller=Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<PostController>(
        
        builder: (controller){
          return   ListView.builder(
            controller: controller.scrollController,
        itemCount: controller.posts.length,
        itemBuilder: (context,i){
          if(i==controller.posts.length-1 && controller.isMoreDataAvilable==true){
            return Center(child: CircularProgressIndicator(),);
          }
          Post post=controller.posts[i];
          return Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
              title: Text(post.name!),
              subtitle: Text(post.description!),
            ),
          );
        }
        );
        })
     
    );
  }
}