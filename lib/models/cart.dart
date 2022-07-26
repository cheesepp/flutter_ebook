class Cart {
  final String id;
  final String title;
  final int quantity;
  final double price;
  String? image = '';

  Cart(
      {required this.id,
      required this.title,
      required this.quantity,
      this.image,
      required this.price});
}
