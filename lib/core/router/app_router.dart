import 'package:go_router/go_router.dart';
import '../../presentation/screens/post/post_list_screen.dart';
import '../../presentation/screens/post/post_details_screen.dart';
import '../../presentation/screens/shop/shop_list_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/shop',
        builder: (context, state) => const ShopListScreen(categoryId: '1'), // Set your default categoryId here
      ),
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
