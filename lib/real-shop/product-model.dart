class Product{
  int? id;
  String? name;
  int? price;
  Product({
this.id,
this.name,
this.price,
  });
  //map json to post model
  factory Product.fromJson(Map<String,dynamic> json){
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}