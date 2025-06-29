import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/router/app_router.dart';
import 'presentation/blocs/post_bloc/post_bloc.dart';
import 'data/repositories/post_repository_impl.dart';
import 'domain/usecases/get_posts_usecase.dart';
import 'presentation/blocs/shop_bloc/shop_bloc.dart';
import 'domain/usecases/get_shops_usecase.dart';
import 'data/repositories/shop_repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PostBloc(GetPostsUseCase(PostRepositoryImpl())),
        ),
        BlocProvider(
          create: (_) => ShopBloc(GetShopsUseCase(ShopRepositoryImpl())),
        ),
        // Add more BlocProviders here as needed
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Zatiq Plus',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
