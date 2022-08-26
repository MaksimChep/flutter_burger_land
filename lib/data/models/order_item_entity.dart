class OrderItem {
  OrderItem(
      {required this.name,
      required this.image,
      required this.count,
      required this.cost});

  final String name;
  final String image;
  int count;
  double cost;

  Map<String, dynamic> toMap() => {
        'name': name,
        'count': count,
      };
}
