class Cart {
  late final int product;
  late final int numOfItems;

  Cart({required this.product, required this.numOfItems});
}

// https://media.istockphoto.com/vectors/blazer-clothes-suit-icon-black-version-vector-id1281580770?k=20&m=1281580770&s=170667a&w=0&h=WjmSlUAR0u0EY71klXF81CLnJqjWEIpGAvsx2TJgKJQ=

List<Cart> demoCarts = [
  Cart(product: 0, numOfItems: 2),
  Cart(product: 1, numOfItems: 1),
  Cart(product: 2, numOfItems: 4),
];
