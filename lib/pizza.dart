class Pizza {
  static const keyId = 'id';
  static const keyName = 'pizzaName';
  static const keyDescription = 'description';
  static const keyPrice = 'price';
  static const keyImage = 'imageUrl';

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

  Pizza();
  static Pizza? fromJsonOrNull(Map<String, dynamic> json) {
    Pizza pizza = Pizza();
    pizza.id = (json[keyId] != null) ?
    int.tryParse(json['id'].toString()) : 0;
    pizza.pizzaName = (json[keyName] != null) ?
    json['pizzaName'].toString() : '';
    pizza.description = (json[keyDescription] != null) ?
    json['description'].toString() : '';
    pizza.price = (json[keyPrice] != null &&
        double.tryParse(json['price'].toString()) != null) ?
    json['price'] : 0.0;
    pizza.imgUrl =(json[keyImage] != null) ?
    json['imgUrl'].toString() : '';
    if (pizza.id == 0 || pizza.pizzaName!.trim() == '') {
      return null;
    }
    return pizza;
  }
}