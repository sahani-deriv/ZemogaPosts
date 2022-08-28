import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_repository/posts_repository.dart';
import 'package:zemoga_posts/features/posts/cubit/post_cubit.dart';
import 'package:zemoga_posts/features/posts/view/tabs/tabs.dart';
import 'package:zemoga_posts/features/posts/view/widgets/tab_view.dart';

/// {@template posts_list_page}
/// The root page of the Zemoga Posts App. Depends on an instance of
/// [PostCubit] for interacting with the external layers.
/// {@endtemplate}
class PostsListPage extends StatelessWidget {
  /// {@macro posts_list_page}
  const PostsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostCubit>(
      create: (context) =>
          PostCubit(postsRepository: context.read<PostsRepository>())
            ..getAllFavoritePosts()
            ..getAllPosts(),
      child: const PostsListView(),
    );
  }
}

/// {@template posts_list_view}
/// Responds to [PostState] changes and notifies
/// user actions to the [PostCubit]. /// It displays list of posts.
/// {@endtemplate}
class PostsListView extends StatelessWidget {
  /// {@macro posts_list_view}
  const PostsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state.status == PostStatus.pending) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == PostStatus.failure) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return AppTabView(
              title: 'Zemoga Posts',
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Favorites'),
              ],
              pages: [
                PostsTab(
                  posts: state.posts,
                  favoritePosts: state.favoritePosts,
                ),
                const FavoritesTab(),
              ],
            );
          }
        },
      ),
    );
  }
}
