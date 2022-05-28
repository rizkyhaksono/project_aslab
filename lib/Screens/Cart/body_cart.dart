import 'package:flutter/material.dart';

import 'package:i_lab/Screens/Cart/Cart.dart';

class BodyCart extends StatelessWidget {
  const BodyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: wItemList(context),
      ),
    );
  }

  Widget wItemList(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Image.network(
                  "https://media.istockphoto.com/vectors/blazer-clothes-suit-icon-black-version-vector-id1281580770?k=20&m=1281580770&s=170667a&w=0&h=WjmSlUAR0u0EY71klXF81CLnJqjWEIpGAvsx2TJgKJQ=",
                  width: size.width / 4,
                  height: size.width / 4,
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Jaket Informatika Lab",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: FloatingActionButton(
                              backgroundColor: const Color(0xFF003C72),
                              // dicrement numbers of items
                              onPressed: () {},
                              child: const Icon(
                                Icons.exposure_minus_1,
                                size: 20,
                              ),
                              mini: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${demoCarts.length} x Rp. 100.000",
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: "Poppins",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: FloatingActionButton(
                              backgroundColor: const Color(0xFF003C72),
                              // increment number of items
                              onPressed: () {},
                              child: const Icon(
                                Icons.plus_one_rounded,
                                size: 20,
                              ),
                              mini: true,
                            ),
                          )
                        ],
                      ),
                      Row()
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
