
class Item {
  final String title;
  final String description;
  final String price;
  final String installments;
  final String photo;
  bool isFavorite;

  Item(
    {
      required this.title,
      required this.description,
      required this.price,
      required this.installments,
      required this.photo,
      this.isFavorite = false
    }
  );

  static void push(Item item) {}
}

