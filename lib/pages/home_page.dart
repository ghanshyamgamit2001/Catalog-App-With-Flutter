import 'package:catalog/models/catalogp.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:catalog/widgets/item_widgets.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Ghanshyam";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items !=null && CatalogModel.items.isNotEmpty)? ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index)  => ItemWidgets(
              item: CatalogModel.items[index],
            ),
        ):Center(
          child: CircularProgressIndicator(),
        ),
      ),
      // ignore: prefer_const_constructors
      drawer: MyDrawer(),
    );
  }
}
