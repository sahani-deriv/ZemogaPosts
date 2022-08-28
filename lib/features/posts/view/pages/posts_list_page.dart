import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_repository/posts_repository.dart';
import 'package:zemoga_posts/app/components/custom_snack_bar.dart';
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
      child: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {
          if (state.message != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.white,
                content: CustomSnackBar(
                  message: state.message!,
                ),
              ),
            );
          }
        },
        builder: (context, state) => AppTabView(
          onTapRefresh: () => context.read<PostCubit>().refetchPosts(),
          isLoading: state.status == PostStatus.pending,
          title: 'Zemoga',
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Favorites'),
          ],
          pages: const [
            PostsTab(),
            FavoritesTab(),
          ],
        ),
      ),
    );
  }
}
