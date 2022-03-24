import 'package:flutter/material.dart';

import 'package:ellipsis_rn_challenge/models/producs_model.dart';
import 'package:ellipsis_rn_challenge/screens/cart/cart_list.dart';
import 'package:ellipsis_rn_challenge/widgets/elevated_button_widget.dart';

// ignore: must_be_immutable
class ProductDescription extends StatefulWidget {
  List cart;
  List<ProductsModel>? product;
  int index;
  String productName;
  String productImage;
  double productPrice;
  String productDescription;
  ProductDescription({
    Key? key,
    required this.cart,
    required this.product,
    required this.index,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDescription,
  }) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 25, right: 10, top: 30),
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height / 4,
                child: Center(child: Image.network(widget.productImage)),
              ),
              SizedBox(height: size.height * 0.01),
              SizedBox(
                child: Center(child: Text(widget.productName)),
              ),
              SizedBox(height: size.height * 0.01),
              SizedBox(
                child: Text(widget.productPrice.toString()),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SizedBox(
                height: size.height / 3,
                child: Text(widget.productDescription),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              elevatedButtonMethod(size, context, "Add To Cart", () {
                widget.cart.add(widget.product![widget.index]);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${widget.productName} added to cart")));
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CartListScreen(cart: widget.cart)));
              })
            ],
          ),
        ),
      )),
    );
  }
}
