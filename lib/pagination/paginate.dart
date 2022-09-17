import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Paginate extends StatefulWidget {
  const Paginate({ Key? key }) : super(key: key);

  @override
  State<Paginate> createState() => _PaginateState();
}

class _PaginateState extends State<Paginate> {
  var uri='http://192.168.30.189:8000/api/books';
  var nextUrl;
  ScrollController _scrollController=new ScrollController();
  List<Test> tempList=[];
  var loadCompleted=false;
  Future<List<Test>> getData(uri)async{
    final response=await http.get(Uri.parse(uri));
    if(response.statusCode == 200){
      var testjson=json.decode(response.body);
      print(testjson);
      var data=testjson['data'];
      if(testjson['next_page_url'] != null){
        nextUrl=testjson['next_page_url'];
      }else{
        loadCompleted=true;
      }
      for(var item in data){
        Test test=Test(item['id'],item['name'],item['writer']);
        tempList.add(test);
      }
      print('&&&&&');
      print(tempList);
      return tempList;
    }else{
      throw Exception('fail to load');
    }
  }
   late Future<List<Test>> data;
 
  @override
  void initState(){
data=getData(uri);
print('>>>>>>>>>>>>>');
print(data);
scrollindecator();
super.initState();
  }
  void scrollindecator(){
    print(_scrollController.position.pixels);
    _scrollController.addListener(() { 
      // if(_scrollController.offset >= _scrollController.position.maxScrollExtent && !_scrollController.position.outOfRange){
      //   print(loadCompleted);
      print('LLLLLLLLLLLLLLL');
        if(loadCompleted = false){
           print(_scrollController.offset);
          setState(() {
          
            data=getData(nextUrl);
              print('\\\\\\\\\\\\\\\\');
print(data);
          });
        // }
      }
    });
  }
      // @override
      // void dispose(){
      //   _scrollController.dispose();
      // }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
controller: _scrollController,
child: Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    FutureBuilder(
      future: data,
      builder: (context,AsyncSnapshot snapshot){
        print(';;;;;;;;;;;;;;;;;');
        print(snapshot.data);
        if(snapshot.hasData){
          return Container(
            child: Center(child: CircularProgressIndicator(),),
          );
        }else{
          return ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data.length ?? 0,
            itemBuilder: (context,i){
if(i==snapshot.data.length - 1 && !loadCompleted){
  return Center(
    child: Opacity(opacity: 1.0,
    child: CircularProgressIndicator(),
    ),
  );
}else{
  return ListTile(
    leading: Text(snapshot.data[i].id.toString()),
    title: Text(snapshot.data[i].name),
  );
}
// return ListTile(
//     leading: Text(snapshot.data[i].id.toString()),
//     title: Text(snapshot.data[i].name),
//    );
            }
            );
        }
      }
      )
  ],
),
      ),
    );
  }
}
class Test{
  int? id;
  String? name;
   String? writer;
   Test(this.id,this.name,this.writer);
}