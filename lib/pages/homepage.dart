import 'package:catalog/core/store.dart';
import 'package:catalog/models/cart.dart';
import 'package:catalog/utils/routes.dart';
import 'package:catalog/widgets/homewidgets/catalogheader.dart';
import 'package:catalog/widgets/homewidgets/cataloglist.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final catalogJson =
    //   await rootBundle.loadString("assets/files/catalog.json");

    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;

    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
            mutations: {AddMutation, RemoveMutation},
            builder: (context, _) => FloatingActionButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, MyRoutes.cartRoute),
                  backgroundColor: context.theme.buttonColor,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ).badge(
                  color: Vx.gray200,
                  size: 22,
                  count: _cart.items.length,
                  textStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(
                    child:
                        CircularProgressIndicator().centered().p64().expand(),
                  )
              ],
            ),
          ),
        ));
  }
}
