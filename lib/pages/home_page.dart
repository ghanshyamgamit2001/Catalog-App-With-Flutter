import 'package:catalog/widgets/drawer.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int days = 30;
    final String name = "Akshar";

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Text("Welcome to Flutter $days devlopment in 30 days by $name"),
      ),
      // ignore: prefer_const_constructors
      drawer: MyDrawer(),
    );
  }
}
