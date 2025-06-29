import '../../domain/entities/shop/shop_entity.dart';
import '../../domain/repositories/shop_repository.dart';
import '../../core/network/shop_api_client.dart';
import '../models/shop_model.dart';

class ShopRepositoryImpl implements ShopRepository {
  final ShopApiClient _apiClient = ShopApiClient();

  @override
  Future<List<ShopEntity>> searchShop({
    required String categoryId,
    String min = '',
    String max = '',
    String filter = '',
  }) async {
    final data = await _apiClient.searchShop(
      categoryId: categoryId,
      min: min,
      max: max,
      filter: filter,
    );
    final List<dynamic> list = data is List ? data : (data['data'] ?? []);
    return list.map((json) => ShopModel.fromJson(json)).toList();
  }
}

