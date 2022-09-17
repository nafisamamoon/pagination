import 'package:flutter/material.dart';
import 'package:mytests/shop/Shop.dart';
import 'package:mytests/shop/all-product.dart';
class Cart extends StatelessWidget {
  //const Cart({ Key? key }) : super(key: key);
List<Shop> list=[];
Cart(this.list);
  @override
  Widget build(BuildContext context) {
    print(list.length);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                   height: 400,
                   child: ListView.builder(
                 
                     itemCount: list.length,
                     itemBuilder: (context,i){
                       return ListTile(
                        title: Text('${list[i].name}'),
                        leading:Text('${list[i].quant}'.toString()) ,
                        subtitle: Text('${list[i].price}'.toString()),
                        trailing: IconButton(onPressed: (){
list[i].quant=list[i].quant!+1;
                        }, icon: Icon(Icons.add),
                        
                        ),
                       );
                     }),
                         ),
       TextButton(onPressed: (){
         Navigator.pop(context);
       }, child: Text('back')
       )
          ],
        ),
      ),
    );
  }
}