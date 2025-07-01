import '../../../../core/network/api_client.dart';
import '../models/post_model.dart';
import '../../domain/entities/post/post_entity.dart';
import '../../domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final ApiClient _apiClient = ApiClient();

  @override
  Future<List<PostEntity>> fetchPosts() async {
    try {
      final data = await _apiClient.get('/posts',headers: {
        "Content-Type" : "application/json"
      });
      print('API Response:');
      print(data);
      return (data as List).map((json) => PostModel.fromJson(json)).toList();
    } catch (e, stack) {
      print('API Error:');
      rethrow;
    }
  }
}
