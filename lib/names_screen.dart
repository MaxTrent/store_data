import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NamesScreen extends StatefulWidget {
  const NamesScreen({Key? key}) : super(key: key);

  @override
  State<NamesScreen> createState() => _NamesScreenState();
}

class _NamesScreenState extends State<NamesScreen> {
  String? nameValue;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Names'),
        ),
        body: Center(
            child: nameValue == null ? Text('No names yet') : Text(nameValue!)),
      ),
    );
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    nameValue = prefs.getString('nameData');
    setState(() {});
  }
}
