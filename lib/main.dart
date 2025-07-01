import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/router/app_router.dart';
import 'features/posts/data/repositories/post_repository_impl.dart';
import 'features/posts/domain/usecases/get_posts_usecase.dart';
import 'features/posts/presentation/blocs/post_bloc/post_bloc.dart';


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
