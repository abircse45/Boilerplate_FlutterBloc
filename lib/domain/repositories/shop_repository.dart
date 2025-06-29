import '../entities/shop/shop_entity.dart';

abstract class ShopRepository {
  Future<List<ShopEntity>> searchShop({
    required String categoryId,
    String min,
    String max,
    String filter,
  });
}

