import '../../domain/entities/shop/shop_entity.dart';

class ShopModel extends ShopEntity {
  ShopModel({
    required int id,
    required String name,
    String? image,
    String? address,
    String? price,
  }) : super(id: id, name: name, image: image, address: address, price: price);

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] ?? '',
      image: json['image'],
      address: json['address'],
      price: json['price']?.toString(),
    );
  }
}
