class ProductCardModel {
  String? title ;
  int? price ;
  String? image ;
  int? quantity ;

  ProductCardModel ({required this.price , required this.title , required this.image , required this.quantity});

  ProductCardModel.fromJson (Map<String , dynamic> json) {
    title = json["title"] ;
    price = json["price"] ;
    image = json["image"] ;
    quantity = json["quantity"] ;
  }

  Map<String , dynamic> toJson () {
    return {
      "title" : title ,
      "price" : price ,
      "image" : image ,
      "quantity" : quantity
    };
  }
}