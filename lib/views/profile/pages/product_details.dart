import 'package:aicha/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../constants/constants.dart';
import '../../components/closeButton.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var user = GetStorage().read("user");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: AddProductToList(widget.product),
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              closeButton(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  height: Constants.screenHeight * 0.4,
                  width: double.infinity,
                  child: Hero(
                      tag: "${widget.product.id}",
                      child: Image.network(
                        "${widget.product.image}",
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Constants.screenHeight * 0.01,
                ),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Constants.screenWidth * 0.06,
                            ),
                            child: Text(
                              "${widget.product.name}",
                              style: TextStyle(
                                  color: Colors.black, fontFamily: "NunitoBold", fontSize: Constants.screenHeight * 0.02),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.screenWidth * 0.1, vertical: Constants.screenHeight * 0.01),
                child: Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(color: Color(0xff42b95e), borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Prix avec la reduction : ${widget.product.priceAfterReduction}",
                          style: TextStyle(
                            fontSize: Constants.screenHeight * 0.02,
                            fontFamily: "NunitoBold",
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "TND ",
                          style: TextStyle(
                            fontSize: Constants.screenHeight * 0.015,
                            fontFamily: "NunitoBold",
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.screenWidth * 0.1, vertical: Constants.screenHeight * 0.01),
                child: Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(color: Color(0xff42b95e), borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Prix originale : ${widget.product.price}",
                          style: TextStyle(
                            fontSize: Constants.screenHeight * 0.02,
                            fontFamily: "NunitoBold",
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "TND ",
                          style: TextStyle(
                            fontSize: Constants.screenHeight * 0.015,
                            fontFamily: "NunitoBold",
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container AddProductToList(Product product) {
    return Container(
      width: Constants.screenWidth * 0.8,
      height: Constants.screenHeight * 0.06,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color(0xffa0c4f6), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          onPressed: () async {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(user['uid'])
                .collection('products')
                .add({"id": product.id, "quantity": 1});
          },
          child: Text(
            "Ajouter au panier",
            style: TextStyle(fontFamily: "NunitoBold"),
          )),
    );
  }
}
