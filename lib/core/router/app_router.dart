import 'package:go_router/go_router.dart';

import '../../features/posts/presentation/screens/post/post_details_screen.dart';
import '../../features/posts/presentation/screens/post/post_list_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const PostListScreen(),
      ),
      GoRoute(
        path: '/post/:id',
        builder: (context, state) {
          final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
          return PostDetailsScreen(postId: id);
        },
      ),
    ],
  );
}
