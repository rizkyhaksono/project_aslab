// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter_native_image/flutter_native_image.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:test_firebase/constants.dart';

// class UploadImageScreen extends StatefulWidget {
//   const UploadImageScreen({Key? key}) : super(key: key);

//   @override
//   State<UploadImageScreen> createState() => _UploadImageScreenState();
// }

// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// class _UploadImageScreenState extends State<UploadImageScreen> {
//   FirebaseStorage firebaseStorage = FirebaseStorage.instance;
//   bool loading = false;

//   // upload image to firebase
//   Future<void> uploadImage(String inputSource) async {
//     final picker = ImagePicker();
//     final XFile? pickedImage = await picker.pickImage(
//         source:
//             inputSource == 'camera' ? ImageSource.camera : ImageSource.gallery);
//     if (pickedImage == null) {
//       return null;
//     }

//     String fileName = pickedImage.name;
//     File imageFile = File(pickedImage.path);
//     // compressed file
//     File compressedFile = await compressImage(imageFile);

//     try {
//       setState(() {
//         loading = true;
//       });
//       await firebaseStorage.ref(fileName).putFile(compressedFile);
//       setState(() {
//         loading = false;
//       });
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text("Berhasil diupload!")));
//     } on FirebaseException catch (e) {
//       print(e);
//     } catch (error) {
//       print(error);
//     } finally {
//       print("Uploaded Successfully");
//     }
//   }

//   // get image from firebase
//   Future<List> loadImages() async {
//     List<Map> files = [];
//     final ListResult result = await firebaseStorage.ref().listAll();
//     final List<Reference> allFiles = result.items;

//     await Future.forEach(allFiles, (Reference file) async {
//       final String fileUrl = await file.getDownloadURL();
//       files.add({
//         "url": fileUrl,
//         "path": file.fullPath,
//       });
//     });
//     print(files);
//     print("Loaded Successfully");
//     return files;
//   }

//   // delete image from firebase
//   Future<void> delete(String ref) async {
//     await firebaseStorage.ref(ref).delete();
//     setState(() {
//       print("Deleted Successfully");
//     });
//   }

//   Future<File> compressImage(File file) async {
//     File compressedImage =
//         await FlutterNativeImage.compressImage(file.path, quality: 50);
//     print("Original Size");
//     print(file.lengthSync());
//     print("Compressed Size");
//     print(compressedImage.lengthSync());
//     print("Compressed Successfully");
//     return compressedImage;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: const Text("Upload Bukti"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             loading
//                 ? const Center(child: CircularProgressIndicator())
//                 : Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton.icon(
//                           onPressed: () {
//                             uploadImage("camera");
//                           },
//                           icon: const Icon(Icons.camera),
//                           label: const Text("Camera")),
//                       ElevatedButton.icon(
//                           onPressed: () {
//                             uploadImage("gallery");
//                           },
//                           icon: const Icon(Icons.library_add),
//                           label: const Text("Gallery")),
//                     ],
//                   ),
//             const SizedBox(height: 20),
//             const SizedBox(
//               height: 50,
//               child: Text(
//                 "Preview Image",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 25,
//                     fontFamily: "Poppins",
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//             Expanded(
//                 child: FutureBuilder(
//                     future: loadImages(),
//                     builder: (context, AsyncSnapshot snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }

//                       var dataImage = snapshot.data.length;

//                       return ListView.builder(
//                           itemCount: dataImage ?? 0,
//                           itemBuilder: (context, index) {
//                             final Map image = snapshot.data[index];
//                             return Row(
//                               children: [
//                                 Expanded(
//                                     child: Card(
//                                   color: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15)),
//                                   child: SizedBox(
//                                     height: 180,
//                                     // width: 300,
//                                     child: CachedNetworkImage(
//                                       imageUrl: image['url'],
//                                       placeholder: (context, url) => Image.asset(
//                                           'assets/images/placeholder-image.png'),
//                                       errorWidget: (context, url, error) =>
//                                           const Icon(Icons.error),
//                                     ),
//                                   ),
//                                 )),
//                                 TextButton(
//                                   onPressed: () async {
//                                     showDialog<String>(
//                                         context: context,
//                                         builder: (BuildContext context) =>
//                                             AlertDialog(
//                                               title: const Text(
//                                                   "Ingin menghapus gambar ini?"),
//                                               content: const Text(
//                                                   "Aksi ini tidak bisa dibatalkan!"),
//                                               actions: <Widget>[
//                                                 TextButton(
//                                                     onPressed: () async {
//                                                       await delete(
//                                                           image['path']);
//                                                       ScaffoldMessenger.of(
//                                                               context)
//                                                           .showSnackBar(
//                                                               const SnackBar(
//                                                                   content: Text(
//                                                                       "Gambar sudah terhapus!")));
//                                                       Navigator.of(context,
//                                                               rootNavigator:
//                                                                   true)
//                                                           .pop();
//                                                     },
//                                                     child: const Text("Ya")),
//                                                 TextButton(
//                                                     onPressed: () async {
//                                                       Navigator.of(context,
//                                                               rootNavigator:
//                                                                   true)
//                                                           .pop();
//                                                     },
//                                                     child: const Text("Tidak"))
//                                               ],
//                                               shape:
//                                                   const RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.only(
//                                                 bottomLeft: Radius.circular(20),
//                                                 bottomRight:
//                                                     Radius.circular(20),
//                                                 topLeft: Radius.circular(20),
//                                                 topRight: Radius.circular(20),
//                                               )),
//                                             ));
//                                   },
//                                   child: const Icon(
//                                     Icons.delete,
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                               ],
//                             );
//                           });
//                     })),
//           ],
//         ),
//       ),
//     );
//   }
// }
