class ShopEntity {
  final int id;
  final String name;
  final String? image;
  final String? address;
  final String? price;

  ShopEntity({
    required this.id,
    required this.name,
    this.image,
    this.address,
    this.price,
  });
}
