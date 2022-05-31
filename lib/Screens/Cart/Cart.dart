// import 'package:firebase_auth/firebase_auth.dart';

class Cart {
  late int jasLab;
  late int jumlah;

  Cart({required this.jasLab, required this.jumlah});
}

class Post {
  String product;
  String quantity;
  int likes = 0;
  Set userliked = {};

  Post(this.product, this.quantity);

  // void likePost() {
  //   this.userliked = !this.userliked;
  //   if (this.userliked) {
  //     this.likes += 1;
  //   } else {
  //     this.likes -= 1;
  //   }
  // }
}

// https://media.istockphoto.com/vectors/blazer-clothes-suit-icon-black-version-vector-id1281580770?k=20&m=1281580770&s=170667a&w=0&h=WjmSlUAR0u0EY71klXF81CLnJqjWEIpGAvsx2TJgKJQ=

List<Cart> demoCarts = [
  Cart(jasLab: 0, jumlah: 2),
  Cart(jasLab: 1, jumlah: 1),
  Cart(jasLab: 2, jumlah: 4),
];

List<Post> demoKeranjang = [
  Post("S", "1"),
  Post("M", "3"),
  Post("L", "2"),
  Post("XL", "5"),
];
