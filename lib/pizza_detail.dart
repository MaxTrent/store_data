import 'package:flutter/material.dart';
import 'package:store_data/httphelper.dart';
import 'pizza.dart';

class PizzaDetails extends StatefulWidget {
  const PizzaDetails({Key? key}) : super(key: key);

  @override
  State<PizzaDetails> createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {
  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtPrice = TextEditingController();
  final TextEditingController txtImageUrl = TextEditingController();
  String postResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                postResult,
                style: TextStyle(
                  backgroundColor: Colors.green,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtId,
                decoration: InputDecoration(
                  hintText: 'Insert ID',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtName,
                decoration: InputDecoration(
                  hintText: 'Insert Pizza Name',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtDescription,
                decoration: InputDecoration(
                  hintText: 'Insert Description',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtPrice,
                decoration: InputDecoration(hintText: 'Insert Price'),
              ),
              TextField(
                controller: txtImageUrl,
                decoration: InputDecoration(
                  hintText: 'Insert Image Url',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () {
                    postPizza();
                  },
                  child: Text('Send Post'))
            ],
          ),
        ),
      ),
    );
  }

  Future postPizza() async{
    HttpHelper helper = HttpHelper();
    Pizza pizza = Pizza();
    pizza.id = int.tryParse(txtId.text);
    pizza.pizzaName = txtName.text;
    pizza.description = txtDescription.text;
    pizza.price = double.tryParse(txtPrice.text);
    pizza.imgUrl = txtImageUrl.text;
    String result = await helper.postPizza(pizza);
    setState(() {
      postResult = result;
    });
    return result;
  }
}
