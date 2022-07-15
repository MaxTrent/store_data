import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Path Provider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Path Provider')),
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String documentsPath = '';
  String tempPath = '';


  @override
  void initState(){
    getPaths();
    super.initState();
  }

  Future getPaths() async{
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Doc Path: ${documentsPath}'),
          Text('Temp Path: ${tempPath}'),
        ],
      ),
    );
  }
}


/*class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final namesController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: namesController,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              hintText: 'Enter Name',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setNamesData(namesController.text);
          },
          child: Text('Save'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
        ),
        ElevatedButton(
          onPressed: onPressed,
          child: Text('View Names'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
        )
      ],
    );
  }

  onPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NamesScreen(),
      ),
    );
  }

  Future<void> setNamesData(nameValue) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('nameData', nameValue);
  }
}*/



/*import 'dart:convert';
import 'package:store_data/pizza.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? appCounter;
  String pizzaString = '';

  @override
  void initState() {
    readAndWritePreference();
    super.initState();
  }

  Future readAndWritePreference() async{
    final prefs = await SharedPreferences.getInstance();
    int? appCounter = prefs.getInt('appCounter')!;
    (appCounter < 1) ? 1 : appCounter++;
    await prefs.setInt('appCounter', appCounter);
    setState(() {
      appCounter = appCounter;
    });
  }

  Future deletePreferences() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
      ),
      body: Container(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    'You have opened the app ' + appCounter.toString() +
                        ' times.'),
                ElevatedButton(
                  onPressed: () {
                    deletePreferences();
                  },
                  child: Text('Reset counter'),
                )],)),
        /*child: FutureBuilder(
          future: readJsonFile(),
          builder: (BuildContext context, AsyncSnapshot<List<Pizza>> pizzas) {
            return ListView.builder(
              itemCount: (pizzas.data == null) ? 0 : pizzas.data!.length,
              itemBuilder: (BuildContext context, int position) {
                return ListTile(
                  title: Text(pizzas.data![position].pizzaName!),
                  subtitle: Text(pizzas.data![position].description! +
                      ' - €' +
                      pizzas.data![position].price.toString()),
                );
              },
            );
          },
        ),*/
      ),
    );
  }

  /*Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist.json');
    List myMap = jsonDecode(myString);

    List<Pizza> myPizzas = [];
    myMap.forEach((dynamic pizza) {
      Pizza? myPizza = Pizza.fromJsonOrNull(pizza);
      if (myPizza != null)
      myPizzas.add(myPizza);
    });
    String json = convertToJson(myPizzas);
    print(json);
    return myPizzas;

  }*/


  /*String convertToJson(List<Pizza> pizzas){
    String json = '[';
    pizzas.forEach((pizza) {
      json += jsonEncode(pizza);
    });
    json += ']';
    return json;
  }*/

} */
