import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveData(String product, String quantity) {
  var id = databaseReference.child('cart/').push();
  final quantity = databaseReference.child('product');
  final product = databaseReference.child('quantity');
  databaseReference.set({
    'product': product,
    'quantity': quantity,
  });
  return databaseReference;
}
