import '../entities/shop/shop_entity.dart';
import '../repositories/shop_repository.dart';

class GetShopsUseCase {
  final ShopRepository repository;
  GetShopsUseCase(this.repository);

  Future<List<ShopEntity>> call({
    required String categoryId,
    String min = '',
    String max = '',
    String filter = '',
  }) async {
    return await repository.searchShop(
      categoryId: categoryId,
      min: min,
      max: max,
      filter: filter,
    );
  }
}

