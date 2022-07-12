class Pizza {
  int? id;
  String? pizzaName;
  String? description;
  double? price;
  String? imgUrl;


  Pizza.fromJson(Map<String, dynamic> json){
    this.id = json['id'];
    this.pizzaName = json['pizzaName'];
    this.description = json['description'];
    this.price = json['price'];
    this.imgUrl = json['imgUrl'];
  }


  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description':  description,
      'price': price,
      'imgUrl': imgUrl,
    };
  }
}