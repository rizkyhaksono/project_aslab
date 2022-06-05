import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_firebase/Screens/Login/login_page_state.dart';

class Post {
  String product;
  Set userItems = {};

  Post(this.product);
}

List<Post> demoKeranjang = [
  Post("S"),
  Post("M"),
  Post("L"),
  Post("XL"),
];
