import 'package:catalog/models/catalogp.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:catalog/widgets/item_widgets.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  
  final int days = 30;
  final String name = "Ghanshyam";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidgets(
              item: dummyList[index],
            );
          },
        ),
      ),
      // ignore: prefer_const_constructors
      drawer: MyDrawer(),
    );
  }
}
