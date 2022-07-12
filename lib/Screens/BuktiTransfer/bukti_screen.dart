// import 'package:flutter/material.dart';

// import 'package:test_firebase/Screens/Database/storage_service.dart';
// import 'package:test_firebase/constants.dart';

// import 'bukti_body.dart';

// class BuktiTF extends StatelessWidget {
//   const BuktiTF({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final Storage storage = Storage();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Padding(
//           padding: EdgeInsets.only(left: 60),
//           child: Text("Bukti Transfer"),
//         ),
//         backgroundColor: kPrimaryDarkColor,
//       ),
//       backgroundColor: Colors.white,
//       body: FutureBuilder(
//         // file path dari bukti_body
//         future: storage.downloadURL('$filePathBukti'),
//         builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//           if (snapshot.connectionState == ConnectionState.done &&
//               snapshot.hasData) {
//             return Center(
//               child: Container(
//                 padding: const EdgeInsets.only(bottom: 300),
//                 child: SizedBox(
//                   width: 200,
//                   height: 200,
//                   child: Image.network(
//                     snapshot.data!,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             );
//           }
//           if (snapshot.connectionState == ConnectionState.waiting ||
//               !snapshot.hasData) {
//             return const CircularProgressIndicator();
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }
=======
import 'package:flutter/material.dart';

import 'package:i_lab/Screens/Database/storage_service.dart';
import 'package:i_lab/constants.dart';

import 'bukti_body.dart';

class BuktiTF extends StatelessWidget {
  const BuktiTF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text("Bukti Transfer"),
        ),
        backgroundColor: kPrimaryDarkColor,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        // file path dari bukti_body
        future: storage.downloadURL('$filePathBukti'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Center(
              child: Container(
                padding: const EdgeInsets.only(bottom: 300),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.network(
                    snapshot.data!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return Container();
        },
      ),
    );
  }
}
