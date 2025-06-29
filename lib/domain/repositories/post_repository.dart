import '../entities/post/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> fetchPosts();
}

