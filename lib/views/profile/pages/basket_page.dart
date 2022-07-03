import 'package:aicha/views/components/action_button.dart';
import 'package:aicha/views/components/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../constants/constants.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  int one = 1;
  int two = 1;
  int three = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Mon Panier",
                style: TextStyle(fontSize: 30, color: Color(0xffa0c4f6), fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(color: Color(0xfff1f5f6), borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Slidable(
                            key: ValueKey(1),
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  backgroundColor: Color(0xff3dc295),
                                  foregroundColor: Colors.white,
                                  icon: Icons.cancel,
                                  label: "Annuler",
                                  onPressed: (BuildContext context) {},
                                ),
                                SlidableAction(
                                  backgroundColor: Color(0xfff563a2),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: "Supprimer",
                                  onPressed: (context) {},
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Constants.screenHeight * 0.01,
                                horizontal: Constants.screenWidth * 0.08,
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  ClipRRect(
                                    child: Container(
                                      width: double.infinity,
                                      height: Constants.screenHeight * 0.15,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: Constants.screenWidth * 0.13, right: Constants.screenWidth * 0.09),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Confiture de pomme",
                                              style: TextStyle(
                                                  decorationThickness: 6, fontFamily: "NunitoBold", color: Colors.black54),
                                            ),
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: Container(
                                                    child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "${7.3 * one}",
                                                      style: TextStyle(
                                                        fontSize: Constants.screenHeight * 0.02,
                                                        fontFamily: "NunitoBold",
                                                        color: Color(0xffeb394d),
                                                      ),
                                                    ),
                                                    Text(
                                                      "TND ",
                                                      style: TextStyle(
                                                        fontSize: Constants.screenHeight * 0.015,
                                                        fontFamily: "NunitoBold",
                                                        color: Color(0xffeb394d),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  Positioned(
                                    left: -30,
                                    top: 25,
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0.8,
                                          blurRadius: 1,
                                          offset: Offset(0, 2), // changes position of shadow
                                        ),
                                      ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                      width: Constants.screenWidth * 0.17,
                                      height: Constants.screenHeight * 0.08,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          "https://www.geantdrive.tn/azur-city/317980-large_default/confiture.jpg",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: -20,
                                    top: 22,
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0.1,
                                          blurRadius: 1,
                                          offset: Offset(0, 2), // changes position of shadow
                                        ),
                                      ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                      width: Constants.screenWidth * 0.1,
                                      height: Constants.screenHeight * 0.1,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    one = one + 1;
                                                  });
                                                },
                                                child: Image.asset(
                                                  "assets/images/plus.png",
                                                  height: Constants.screenHeight * 0.027,
                                                )),
                                          ),
                                          Text(
                                            "${one}",
                                            style: TextStyle(fontFamily: "NunitoBold"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (one != 1) {
                                                      one = one - 1;
                                                    }
                                                  });
                                                },
                                                child: Image.asset(
                                                  "assets/images/minus.png",
                                                  height: Constants.screenHeight * 0.027,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(color: Color(0xfff1f5f6), borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Slidable(
                            key: ValueKey(1),
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  backgroundColor: Color(0xff3dc295),
                                  foregroundColor: Colors.white,
                                  icon: Icons.cancel,
                                  label: "Annuler",
                                  onPressed: (BuildContext context) {},
                                ),
                                SlidableAction(
                                  backgroundColor: Color(0xfff563a2),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: "Supprimer",
                                  onPressed: (context) {},
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Constants.screenHeight * 0.01,
                                horizontal: Constants.screenWidth * 0.08,
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  ClipRRect(
                                    child: Container(
                                      width: double.infinity,
                                      height: Constants.screenHeight * 0.15,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: Constants.screenWidth * 0.13, right: Constants.screenWidth * 0.09),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Lait concentré",
                                              style: TextStyle(
                                                  decorationThickness: 6, fontFamily: "NunitoBold", color: Colors.black54),
                                            ),
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: Container(
                                                    child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "${8.3 * two}",
                                                      style: TextStyle(
                                                        fontSize: Constants.screenHeight * 0.02,
                                                        fontFamily: "NunitoBold",
                                                        color: Color(0xffeb394d),
                                                      ),
                                                    ),
                                                    Text(
                                                      "TND ",
                                                      style: TextStyle(
                                                        fontSize: Constants.screenHeight * 0.015,
                                                        fontFamily: "NunitoBold",
                                                        color: Color(0xffeb394d),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  Positioned(
                                    left: -30,
                                    top: 25,
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0.8,
                                          blurRadius: 1,
                                          offset: Offset(0, 2), // changes position of shadow
                                        ),
                                      ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                      width: Constants.screenWidth * 0.17,
                                      height: Constants.screenHeight * 0.08,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          "https://www.geantdrive.tn/azur-city/313207-home_default/lait-concentre.jpg",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: -20,
                                    top: 22,
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0.1,
                                          blurRadius: 1,
                                          offset: Offset(0, 2), // changes position of shadow
                                        ),
                                      ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                      width: Constants.screenWidth * 0.1,
                                      height: Constants.screenHeight * 0.1,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    two = two + 1;
                                                  });
                                                },
                                                child: Image.asset(
                                                  "assets/images/plus.png",
                                                  height: Constants.screenHeight * 0.027,
                                                )),
                                          ),
                                          Text(
                                            "${two}",
                                            style: TextStyle(fontFamily: "NunitoBold"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (two != 1) {
                                                      two = two - 1;
                                                    }
                                                  });
                                                },
                                                child: Image.asset(
                                                  "assets/images/minus.png",
                                                  height: Constants.screenHeight * 0.027,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(color: Color(0xfff1f5f6), borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Slidable(
                            key: ValueKey(1),
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  backgroundColor: Color(0xff3dc295),
                                  foregroundColor: Colors.white,
                                  icon: Icons.cancel,
                                  label: "Annuler",
                                  onPressed: (BuildContext context) {},
                                ),
                                SlidableAction(
                                  backgroundColor: Color(0xfff563a2),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: "Supprimer",
                                  onPressed: (context) {},
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Constants.screenHeight * 0.01,
                                horizontal: Constants.screenWidth * 0.08,
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  ClipRRect(
                                    child: Container(
                                      width: double.infinity,
                                      height: Constants.screenHeight * 0.15,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: Constants.screenWidth * 0.13, right: Constants.screenWidth * 0.09),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Confiture Delicia",
                                              style: TextStyle(
                                                  decorationThickness: 6, fontFamily: "NunitoBold", color: Colors.black54),
                                            ),
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: Container(
                                                    child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "${5.3 * three}",
                                                      style: TextStyle(
                                                        fontSize: Constants.screenHeight * 0.02,
                                                        fontFamily: "NunitoBold",
                                                        color: Color(0xffeb394d),
                                                      ),
                                                    ),
                                                    Text(
                                                      "TND ",
                                                      style: TextStyle(
                                                        fontSize: Constants.screenHeight * 0.015,
                                                        fontFamily: "NunitoBold",
                                                        color: Color(0xffeb394d),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  Positioned(
                                    left: -30,
                                    top: 25,
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0.8,
                                          blurRadius: 1,
                                          offset: Offset(0, 2), // changes position of shadow
                                        ),
                                      ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                      width: Constants.screenWidth * 0.17,
                                      height: Constants.screenHeight * 0.08,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          "https://www.geantdrive.tn/azur-city/239970-home_default/confiture-de-fruit-sans-gluten.jpg",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: -20,
                                    top: 22,
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0.1,
                                          blurRadius: 1,
                                          offset: Offset(0, 2), // changes position of shadow
                                        ),
                                      ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                      width: Constants.screenWidth * 0.1,
                                      height: Constants.screenHeight * 0.1,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    three = three + 1;
                                                  });
                                                },
                                                child: Image.asset(
                                                  "assets/images/plus.png",
                                                  height: Constants.screenHeight * 0.027,
                                                )),
                                          ),
                                          Text(
                                            "$three",
                                            style: TextStyle(fontFamily: "NunitoBold"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (three != 1) {
                                                      three = three - 1;
                                                    }
                                                  });
                                                },
                                                child: Image.asset(
                                                  "assets/images/minus.png",
                                                  height: Constants.screenHeight * 0.027,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Text(
                          "Totale : 20.3Dt",
                          style: TextStyle(color: Colors.blueAccent, fontSize: 30),
                        )),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Livraison : 3.3Dt",
                          style: TextStyle(color: Colors.blueAccent, fontSize: 30),
                        )),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "TTC: 23.3.3Dt",
                          style: TextStyle(color: Colors.blueAccent, fontSize: 30),
                        )),
                    buildActionButton("Finaliser la procedure", () {
                      TextEditingController controller = TextEditingController();
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return Container(
                                margin: EdgeInsets.only(bottom: Constants.screenHeight * 0.009),
                                height: Constants.screenHeight * 0.4,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    inputField("Numéro de carte", TextInputType.number, controller),
                                    inputField("CCV", TextInputType.number, controller),
                                    buildActionButton("Terminer", () {})
                                  ],
                                ));
                          },
                          context: context);
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
