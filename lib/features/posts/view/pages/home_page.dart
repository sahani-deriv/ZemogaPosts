import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:posts_repository/posts_repository.dart';
import 'package:zemoga_posts/app/components/components.dart';
import 'package:zemoga_posts/features/posts/cubit/post_cubit.dart';
import 'package:zemoga_posts/features/posts/view/tabs/tabs.dart';
import 'package:zemoga_posts/features/posts/view/widgets/widgets.dart';

/// {@template home_page}
/// The root page of the Zemoga Posts App. Depends on an instance of
/// [PostCubit] for interacting with the external layers.
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostCubit>(
      create: (context) =>
          PostCubit(postsRepository: context.read<PostsRepository>())
            ..getAllFavoritePosts()
            ..getAllPosts(),
      child: const HomeView(),
    );
  }
}

/// {@template home_view}
/// Responds to [PostState] changes and notifies
/// user actions to the [PostCubit]. /// It displays list of posts.
/// {@endtemplate}
class HomeView extends StatelessWidget {
  /// {@macro home_view}
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<PostCubit, PostState>(
        listener: (context, state) {
          final message = state.message;
          if (message != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.white,
                content: AppSnackBar(message: message),
              ),
            );
          }
          return state.maybeWhen(
            pending: (_, __) => EasyLoading.show(),
            orElse: EasyLoading.dismiss,
          );
        },
        child: AppTabView(
          onTapDelete: () => showDialog<Widget>(
            context: context,
            builder: (_) => AppDialog(
              title: 'Delete Alert',
              description:
                  'This will also delete all the posts except for favorites.',
              onTapConfirm: () => context.read<PostCubit>().deleteAllPosts(),
            ),
          ),
          title: 'Zemoga',
          tabs: const [Tab(text: 'All'), Tab(text: 'Favorites')],
          pages: [
            PostsTab(onTapRefresh: context.read<PostCubit>().refetchPosts),
            const FavoritesTab()
          ],
        ),
      ),
    );
  }
}
