import 'package:flutter/material.dart';
import 'package:test_firebase/Screens/Cart/Cart.dart';

class BodyCart extends StatefulWidget {
  const BodyCart({Key? key}) : super(key: key);

  @override
  State<BodyCart> createState() => _BodyCartState();
}

class _BodyCartState extends State<BodyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: listCart(context),
      ),
    );
  }

  Widget listCart(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 20),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xFFC4C4C4),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Image.network(
                    "https://media.istockphoto.com/vectors/blazer-clothes-suit-icon-black-version-vector-id1281580770?k=20&m=1281580770&s=170667a&w=0&h=WjmSlUAR0u0EY71klXF81CLnJqjWEIpGAvsx2TJgKJQ=",
                    width: size.width / 4,
                    height: size.width / 4,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "",
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: FloatingActionButton(
                              heroTag: null,
                              backgroundColor: const Color(0xFF003C72),
                              // dicrement numbers of items
                              onPressed: () {
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 20,
                              ),
                              mini: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${demoKeranjang.length} x Rp. 100.000",
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
                              heroTag: null,
                              backgroundColor: const Color(0xFF003C72),
                              // decrease numbers of items
                              onPressed: () {
                                setState(() {
                                  // error
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                size: 20,
                              ),
                              mini: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
