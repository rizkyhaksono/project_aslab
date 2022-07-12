// import 'package:flutter/material.dart';
// import 'package:test_firebase/Screens/Cart/cart_page.dart';
// import 'package:test_firebase/constants.dart';

// class UploadImages extends StatefulWidget {
//   const UploadImages({Key? key}) : super(key: key);

//   @override
//   State<UploadImages> createState() => _UploadImagesState();
// }

// class _UploadImagesState extends State<UploadImages> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: backgroundcolor,
//       child: SafeArea(
//         top: true,
//         child: Scaffold(
//           appBar: AppBar(
//             toolbarHeight: 76,
//             leading: Container(
//               margin: const EdgeInsets.only(bottom: 9, left: 10),
//               height: 66,
//               alignment: Alignment.centerLeft,
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_back_ios),
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const CartPage()));
//                 },
//               ),
//             ),
//             title: Container(
//               margin: const EdgeInsets.only(bottom: 9),
//               height: 66,
//               alignment: Alignment.centerLeft,
//               child: const Text("Test"),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
