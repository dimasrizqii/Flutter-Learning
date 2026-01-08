import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';
import '../bloc/post_state.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  Future<void> _handleRefresh(BuildContext context) async {
    final bloc = context.read<PostBloc>();
    final future = bloc.stream.firstWhere(
      (state) => state.status != PostStatus.loading,
    );
    bloc.add(const PostsFetched());
    await future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.initial:
            case PostStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PostStatus.failure:
              return _ErrorSection(
                message: state.errorMessage ?? 'Unknown error',
                onRetry: () =>
                    context.read<PostBloc>().add(const PostsFetched()),
              );
            case PostStatus.success:
              final posts = state.posts;
              return RefreshIndicator(
                onRefresh: () => _handleRefresh(context),
                child: posts.isEmpty
                    ? ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: const [
                          SizedBox(
                            height: 200,
                            child: Center(child: Text('No posts available')),
                          ),
                        ],
                      )
                    : ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: posts.length,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 0),
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          return Card(
                            child: ListTile(
                              title: Text(post.title),
                              subtitle: Text(
                                post.body,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: CircleAvatar(
                                child: Text(post.id.toString()),
                              ),
                            ),
                          );
                        },
                      ),
              );
          }
        },
      ),
    );
  }
}

class _ErrorSection extends StatelessWidget {
  const _ErrorSection({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: onRetry, child: const Text('Coba Lagi')),
          ],
        ),
      ),
    );
  }
}
