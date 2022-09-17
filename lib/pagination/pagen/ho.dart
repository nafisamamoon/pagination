import 'package:flutter/material.dart';
class Ho extends StatefulWidget {
  const Ho({ Key? key }) : super(key: key);

  @override
  State<Ho> createState() => _HoState();
}

class _HoState extends State<Ho> {
  ScrollController? _scrollController=ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    // _scrollController=ScrollController();
    // print(_scrollController!.position.maxScrollExtent);
    _scrollController!.addListener(() { 
      print(_scrollController!.position.pixels);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       height: 900,
        child: ListView.builder(
           controller: _scrollController,
         itemCount: 20,
         itemBuilder: (context,i){
           return Container(
             height: 90,
             width: double.infinity,
             color: Colors.red,
             child: Text('jo'));
         }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
         print(_scrollController!.position.maxScrollExtent);
        _scrollController!.jumpTo(0);
      }),
    );
  }
}