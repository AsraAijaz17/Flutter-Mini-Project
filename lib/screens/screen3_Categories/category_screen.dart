import 'package:flutter/material.dart';

import 'package:flutterscndpractice/data/categories_list.dart';
import 'package:flutterscndpractice/screens/screen6_Cart/my_cart.dart';
import 'package:flutterscndpractice/screens/screen7_subCategory/subCat_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../DATA/cart.dart';
import 'categorycards.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            height: 252,
            color: Color(0xFF2A4BA0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  color: Color(0xFF2A4BA0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Hey, Halal",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                      // IconButton(
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => MyCart()));
                      //     },
                      //     icon: const FaIcon(
                      //       FontAwesomeIcons.cartShopping,
                      //       color: Colors.white,
                      //     ))
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Color(
                                  0xFF2a4ba0), // Specify the background color here
                            ),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyCart(items: cart),
                                ),
                              );
                              setState(() {});
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.cartShopping,
                              color: Colors.white,
                            ),
                            label: Text(""),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 12, // Adjust the radius as needed
                            child: Text(
                              cart.length.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                //-----------------------
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 126,
                    width: 299,
                    color: Color(0xFF2A4BA0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Shop",
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "By Category",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: CategoryData.length,
                  itemBuilder: (context, index) {
                    return CategoryCards(
                        onTap: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubCategoryView()));
                          setState(() {});
                        },
                        CategoryName: CategoryData[index]["CategoryName"],
                        Origin: CategoryData[index]["Origin"],
                        CategoryImage: CategoryData[index]["CategoryImage"]);
                  }),
            ),
          )
        ],
      ),
    ));
  }
}
