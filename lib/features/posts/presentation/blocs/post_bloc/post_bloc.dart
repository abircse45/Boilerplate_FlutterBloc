import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_event.dart';
import 'post_state.dart';
import '../../../domain/usecases/get_posts_usecase.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostsUseCase getPostsUseCase;
  PostBloc(this.getPostsUseCase) : super(PostInitial()) {
    on<FetchPosts>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await getPostsUseCase();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });
  }
}
