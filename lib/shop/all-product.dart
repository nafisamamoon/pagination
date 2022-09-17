import 'package:flutter/material.dart';
import 'package:mytests/shop/Shop.dart';
import 'package:mytests/shop/cart.dart';
class AllProduct extends StatelessWidget {
  //const AllProduct({ Key? key }) : super(key: key);
List<Shop> products=[
  Shop(
    name: 'product1',
    price: 33.3,
    quant: 0
  ),
   Shop(
    name: 'product2',
    price: 33.3,
    quant: 0
  ),
];
List<Shop> carts=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:SingleChildScrollView(
       child: Column(
          children: [
             Container(
             height: 200,
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount: products.length,
               itemBuilder: (context,i){
                 return Padding(
      padding: const EdgeInsets.only(right:8.0,left: 8),
      child: Column(
        children: [
          Container(
            height: 20,
            width: 70,
         decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(50)
            ),
            child: Text('${products[i].name}'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text('${products[i].price}'.toString()),
          ),
            Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextButton(onPressed: (){
            if(carts.length==0){
            carts.add(products[i]);  
            carts[i].quant=carts[i].quant!+1;
            print(carts[i].quant);
            }else{
for(int j=0;j<carts.length;j++){
  if(carts[j].name==products[i].name){
  //  products[i].quant=products[i].quant!+1;
  // return ;
  // print('jj');
   carts[i].quant=carts[i].quant!+1;
     print(carts[i].quant);
     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cart(carts)));
   return ;
}
}
// print('out');
 carts.add(products[i]);
  carts[i].quant=carts[i].quant!+1;
    print(carts[i].quant);
//  products[i].quant=products[i].quant!+1;
print(carts.length); 
}
          

Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cart(carts)));
              }, child: Text('Add To Cart')),
          ),
        ],
      ),
    );
               }),
                   ),

 TextButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cart(carts)));
       }, child: Text('forword')
       )
  


  
          ],
        ))
      )
    );
  }
}