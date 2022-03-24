import 'package:ellipsis_rn_challenge/models/producs_model.dart';
import 'package:ellipsis_rn_challenge/screens/cart/cart_list.dart';
import 'package:ellipsis_rn_challenge/screens/products/product_description.dart';
import 'package:ellipsis_rn_challenge/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List cart = [];

  Future<List<ProductsModel>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List list = json.decode(response.body);
      var products =
          list.map((products) => ProductsModel.fromMap(products)).toList();
      return products;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      throw Exception('Failed to load products');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Products",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: size.height / 1.25,
        margin: const EdgeInsets.only(left: 25, right: 10, top: 30),
        child: FutureBuilder<List<ProductsModel>>(
            future: fetchProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 9.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: (1 / 1.4)),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDescription(
                                    cart: cart,
                                    product: snapshot.data,
                                    productName:
                                        snapshot.data![index].productName,
                                    productImage:
                                        snapshot.data![index].productImage,
                                    productPrice: snapshot.data![index].price,
                                    productDescription: snapshot
                                        .data![index].productDescription,
                                    index: index,
                                  )));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 4, left: 10, right: 10),
                                  height: size.height / 8,
                                  width: size.width / 0.5,
                                  child: Image.network(
                                    snapshot.data![index].productImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Center(
                                  child: Text(snapshot.data![index].productName,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                SizedBox(
                                  height: size.height / 20,
                                  child: SingleChildScrollView(
                                    child: Text(
                                        snapshot
                                            .data![index].productDescription,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          snapshot.data![index].price
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      IconButton(
                                          onPressed: () async {
                                            cart.add(snapshot.data![index]);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "${snapshot.data![index].productName} added to cart")));
                                          },
                                          icon: const Icon(
                                            Icons.add_shopping_cart,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.1,
        width: 425,
        margin: const EdgeInsets.only(left: 25, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.shop,
                color: blue,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Text(
                "Products",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ]),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CartListScreen(cart: cart)));
              },
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      color: blue,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const Text(
                      "Cart",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
