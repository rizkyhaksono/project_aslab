import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:test_firebase/Screens/Alert/alert_false_popup.dart';
import 'package:test_firebase/Screens/Alert/alert_true_pop.dart';
import 'package:test_firebase/Screens/Cart/cart_page.dart';
import 'package:test_firebase/Screens/Dashboard/main_dashboard.dart';
import 'package:test_firebase/Screens/Database/data_test.dart';
import 'package:test_firebase/Screens/Login/login_page_state.dart';
import 'package:test_firebase/Screens/paymentMethod/components/BcaPayment.dart';
import 'package:test_firebase/Screens/paymentMethod/payment.dart';
import 'package:test_firebase/constants.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

// GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
final databaseRef = FirebaseDatabase.instance.reference();
String tanggal = DateFormat("dd-MM-yyyy").format(DateTime.now());
var tanggalDB = tanggal;

class _UploadImageScreenState extends State<UploadImageScreen> {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  bool loading = false;

  // upload image to firebase
  Future<void> uploadImage(String inputSource) async {
    final picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
        source:
            inputSource == 'camera' ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage == null) {
      return null;
    }

    String fileName = pickedImage.name;
    File imageFile = File(pickedImage.path);
    // compressed file
    File compressedFile = await compressImage(imageFile);

    try {
      setState(() {
        loading = true;
      });
      await firebaseStorage.ref(fileName).putFile(compressedFile);
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Berhasil diupload!")));
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    } finally {
      print("Uploaded Successfully");
    }
  }

  // get image from firebase
  Future<List> loadImages() async {
    List<Map> files = [];
    final ListResult result = await firebaseStorage.ref().listAll();
    final List<Reference> allFiles = result.items;

    await Future.forEach(allFiles, (Reference file) async {
      final String fileUrl = await file.getDownloadURL();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
      });
    });
    print(files);
    print("Loaded Successfully");
    return files;
  }

  // delete image from firebase
  Future<void> delete(String ref) async {
    await firebaseStorage.ref(ref).delete();
    setState(() {
      print("Deleted Successfully");
    });
  }

  Future<File> compressImage(File file) async {
    File compressedImage =
        await FlutterNativeImage.compressImage(file.path, quality: 50);
    print("Original Size");
    print(file.lengthSync());
    print("Compressed Size");
    print(compressedImage.lengthSync());
    print("Compressed Successfully");
    return compressedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // key: _scaffoldKey,
      color: backgroundcolor,
      child: SafeArea(
        top: true,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 76,
            leading: Container(
              margin: const EdgeInsets.only(bottom: 9, left: 10),
              height: 66,
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Payment()),
                  );
                  databaseRef.child("JasAslab").update({
                    'isOrder': false,
                    'ukuran': false,
                    'jumlah': 1,
                    'isBank': false,
                  });
                },
              ),
            ),
            title: Container(
              margin: const EdgeInsets.only(bottom: 9),
              height: 66,
              alignment: Alignment.centerLeft,
              child: const Text(
                "Tanda Bukti Transfer",
                style: TextStyle(
                    fontFamily: "Monsterrat",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            flexibleSpace: Stack(
              children: [
                Container(
                  height: 76,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(8)),
                ),
                Container(
                  height: 66,
                  color: backgroundcolor,
                ),
              ],
            ),
            elevation: 0,
            backgroundColor: const Color(0xFFC4C4C4),
          ),
          body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  loading
                      ? const Center(child: CircularProgressIndicator())
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    primary: backgroundcolor),
                                onPressed: () {
                                  uploadImage("camera");
                                },
                                icon: const Icon(
                                  Icons.camera,
                                  color: kPrimaryColor,
                                ),
                                label: const Text(
                                  "Camera",
                                  style: TextStyle(
                                      fontFamily: "Monsterrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    primary: backgroundcolor),
                                onPressed: () {
                                  uploadImage("gallery");
                                },
                                icon: const Icon(
                                  Icons.library_add,
                                  color: kPrimaryColor,
                                ),
                                label: const Text(
                                  "Gallery",
                                  style: TextStyle(
                                      fontFamily: "Monsterrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          ],
                        ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    height: 50,
                    child: Text(
                      "Preview Image",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "Monsterrat",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                      child: FutureBuilder(
                          future: loadImages(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return ListView.builder(
                                itemCount: snapshot.data.length ?? 0,
                                itemBuilder: (context, index) {
                                  final Map image = snapshot.data[index];
                                  return Row(
                                    children: [
                                      Expanded(
                                          child: Card(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: SizedBox(
                                          height: 180,
                                          // width: 300,
                                          child: CachedNetworkImage(
                                            imageUrl: image['url'],
                                            placeholder: (context, url) =>
                                                Image.asset(
                                                    'assets/images/placeholder-image.png'),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                      )),
                                      TextButton(
                                        onPressed: () async {
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                    title: const Text(
                                                        "Ingin menghapus gambar ini?"),
                                                    content: const Text(
                                                        "Aksi ini tidak bisa dibatalkan!"),
                                                    actions: <Widget>[
                                                      TextButton(
                                                          onPressed: () async {
                                                            await delete(
                                                                image['path']);
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    const SnackBar(
                                                                        content:
                                                                            Text("Gambar sudah terhapus!")));
                                                            Navigator.of(
                                                                    context,
                                                                    rootNavigator:
                                                                        true)
                                                                .pop();
                                                          },
                                                          child:
                                                              const Text("Ya")),
                                                      TextButton(
                                                          onPressed: () async {
                                                            Navigator.of(
                                                                    context,
                                                                    rootNavigator:
                                                                        true)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              "Tidak"))
                                                    ],
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                      bottomLeft:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20),
                                                      topLeft:
                                                          Radius.circular(20),
                                                      topRight:
                                                          Radius.circular(20),
                                                    )),
                                                  ));
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          })),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          databaseRef.child("JasAslab").update({
                            'isOrder': true,
                            'ukuran': selectedItem,
                            'jumlah': 1,
                            'tanggal': tanggalDB,
                          });
                          var ref = FirebaseDatabase.instance
                              .reference()
                              .child('JasAslab');

                          ref.once().then((DataSnapshot snapshot) {
                            isOrderDB = snapshot.value['isOrder'];
                            ukuranDB = snapshot.value['ukuran'];
                            jumlahDB = snapshot.value['jumlah'];
                            bankDB = snapshot.value['isBank'];
                            print("Order : $isOrderDB");
                            print("Ukuran : $ukuranDB");
                            print("Jumlah : $jumlahDB");
                            print("Bank : $bankDB");
                          });

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (selectedItem == null)
                                      ? const AlertFalsePop()
                                      : const AlertTruePop()));
                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => states.any((element) =>
                                        element == MaterialState.pressed)
                                    ? kPrimaryDarkColor
                                    : kPrimaryColor),
                            minimumSize:
                                MaterialStateProperty.all(const Size(206, 43)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: const Text(
                          "Konfirmasi",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
