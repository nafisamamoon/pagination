class Cart{
  int? id;
  int? product_id;
  int? quantity;
   int? price;
    String? name;
     int? totalprice;
     int? allproductPrice;
  Cart({
this.id,
this.product_id,
this.quantity,
this.name,
this.price,
this.totalprice,
this.allproductPrice
  });
  //map json to post model
  factory Cart.fromJson(Map<String,dynamic> json){
    return Cart(
      id: json['id'],
      product_id: json['product_id'],
      quantity: json['quantity'],
       name: json['name'],
      price: json['price'],
       totalprice: json['total_price'],
       allproductPrice:json['allproductPrice']
    );
  }
}