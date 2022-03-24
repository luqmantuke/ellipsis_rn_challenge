import 'package:ellipsis_rn_challenge/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartListScreen extends StatefulWidget {
  List cart;
  CartListScreen({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          centerTitle: true,
          actions: [
            const Icon(
              Icons.shopping_bag,
            ),
            SizedBox(
              width: size.height * 0.01,
            ),
            Center(
                child: Text(widget.cart.length.toString(),
                    style: const TextStyle(fontSize: 14))),
            SizedBox(
              width: size.height * 0.03,
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
                height: size.height / 1.5,
                margin: const EdgeInsets.only(left: 25, right: 10, top: 30),
                child: SizedBox(
                  height: size.height,
                  child: ListView.builder(
                      itemCount: widget.cart.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: SizedBox(
                                height: size.height * 0.5,
                                width: size.width * 0.30,
                                child: Image.network(
                                    widget.cart[index].productImage)),
                            title: Text(
                              widget.cart[index].productName,
                              style: const TextStyle(fontSize: 14),
                            ),
                            subtitle: Text(
                              widget.cart[index].price.toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        );
                      }),
                )),
            SizedBox(
              height: size.height * 0.03,
            ),
            elevatedButtonMethod(size, context, "Submit", () {})
          ],
        ));
  }
}
