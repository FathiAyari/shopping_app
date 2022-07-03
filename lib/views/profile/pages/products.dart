import 'package:aicha/views/profile/pages/product_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/constants.dart';
import '../../../models/product.dart';
import '../../components/save_item.dart';

class Products extends StatefulWidget {
  final String storeName;
  const Products({Key? key, required this.storeName}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Color(0xffa0c4f6), //change your color here
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                "Les produits de ${widget.storeName}",
                style: TextStyle(color: Color(0xffa0c4f6)),
              ),
            ),
            backgroundColor: Color(0xfff1f5f6),
            body: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('products').where("storeName", isEqualTo: widget.storeName).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var products = snapshot.data!.docs.toList();
                  List<Product> productsList = [];
                  for (var data in products) {
                    productsList.add(Product.fromJson(data.data() as Map<String, dynamic>));
                  }
                  return GridView.builder(
                      itemCount: productsList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(ProductDetails(product: productsList[index]));
                          },
                          child: Container(
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          child: Hero(
                                        tag: productsList[index].id,
                                        child: Image.network(
                                          "${productsList[index].image}",
                                        ),
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.all(Constants.screenHeight * 0.001),
                                              child: Container(
                                                child: Text(
                                                  "${productsList[index].name}",
                                                  style: TextStyle(
                                                      color: Colors.black.withOpacity(0.8),
                                                      fontFamily: "SourceSansPro",
                                                      fontSize: Constants.screenHeight * 0.02),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5, top: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(20), bottomRight: Radius.circular(15))),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(3.0),
                                                  child: Text(
                                                    "${productsList[index].priceAfterReduction} TND",
                                                    style: const TextStyle(
                                                        color: Colors.white, fontFamily: "NunitoBold", fontSize: 17),
                                                  ),
                                                ),
                                              ),
                                              alignment: Alignment.topRight,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SaveItem(productsList[index]),
                              ],
                            ),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                          ),
                        );
                      });
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            )));
  }
}
