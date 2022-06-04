import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_firebase/Screens/Login/login_page_state.dart';
import 'package:test_firebase/Screens/Database/database.dart';

class Post {
  String product;
  int items = 0;
  Set userItems = {};

  Post(this.product, this.items);

  void likePost() {
    if (this.userItems.contains(nimUser)) {
      this.userItems.remove(nimUser);
    } else {
      this.userItems.add(nimUser);
    }
  }
}

List<Post> demoKeranjang = [
  Post("S", 0),
  Post("M", 0),
  Post("L", 0),
  Post("XL", 0),
];
