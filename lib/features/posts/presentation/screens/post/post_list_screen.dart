import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../blocs/post_bloc/post_bloc.dart';
import '../../blocs/post_bloc/post_event.dart';
import '../../blocs/post_bloc/post_state.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postBloc = context.read<PostBloc>();
    if (postBloc.state is PostInitial) {
      postBloc.add(FetchPosts());
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return Card(
                  elevation: 10,
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
                    onTap: () => context.push('/post/${post.id}'),
                  ),
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No data'));
        },
      ),
    );
  }
}
