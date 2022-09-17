import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class TT extends StatefulWidget {
  const TT({ Key? key }) : super(key: key);

  @override
  State<TT> createState() => _TTState();
}

class _TTState extends State<TT> {
  String baseUrl='http://192.168.30.189:8000/api/books';
  int page=1;
  bool isFirstLoad=false;
  List posts=[];
  bool hasNextPage=true;
  bool isLoadMoreRunning=false;
  void loadMore()async{
if(hasNextPage == true && isFirstLoad==false && isLoadMoreRunning==false && controller.position.extentAfter<300){
      setState(() {
        isLoadMoreRunning=true;
      });
page+=1;
try{
    final res=await http.get(Uri.parse('$baseUrl?page=$page'));
       var n=json.decode(res.body);
    final List fetedPost=n['data'];
     print('-------------------------');
    print(fetedPost);
      print('-------------------------');
    if(fetedPost.isNotEmpty){
      setState(() {
        posts.addAll(fetedPost);
      });
    }else{
      print('no more data');
      setState(() {
        hasNextPage=false;
      });
    }
}catch(e){
  print('error2');
}
       setState(() {
        isLoadMoreRunning=false;
      });
    }
  }


  void firstLoad()async{
    setState(() {
      isFirstLoad=true;
    });
try{
  final res=await http.get(Uri.parse('$baseUrl?page=$page'));
  setState(() {
    var m=json.decode(res.body);
//     print(m);
//     print('/////////////////////');
// print(m['data']);
    posts=m['data'];
      // print('*********');
print(posts);
  });
}catch(er){
  print('error');
}
      setState(() {
      isFirstLoad=false;
    });
  }

  late ScrollController controller;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstLoad();
    controller=ScrollController()..addListener(loadMore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isFirstLoad ?Center(child: CircularProgressIndicator(),):
      Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: posts.length,
            controller: controller,
            itemBuilder: (context,i){
              return ListTile(
                title: Text(posts[i]['name']),
                subtitle: Text(posts[i]['description']),
              );
            })),
            if(isLoadMoreRunning==true)
            Padding(padding: EdgeInsets.only(top: 1,bottom: 10),
            child: Center(child: CircularProgressIndicator(color: Colors.red,),),)
        ],
      ),
    );
  }
}