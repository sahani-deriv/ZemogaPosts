import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_api_client/posts_api_client.dart';
import 'package:zemoga_posts/app/components/custom_dialog.dart';
import 'package:zemoga_posts/features/posts/cubit/post_cubit.dart';
import 'package:zemoga_posts/features/posts/view/pages/post_details_page.dart';
import 'package:zemoga_posts/features/posts/view/widgets/post_card.dart';

///{@template functional_post_tab}
/// Post card with the on tap functionality
/// {@endtemplate}
class FunctionalPostCard extends StatelessWidget {
  ///{@macro functional_post_tab}
  const FunctionalPostCard({
    super.key,
    required this.post,
    required this.isFavorite,
  });

  /// Post to be displayed
  final Post post;

  /// Whether the post is favorite or not
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return PostCard(
      onTap: () => onTapPostCard(
        post: post,
        context: context,
        isFavorite: isFavorite,
      ),
      isFavorite: isFavorite,
      title: post.title,
    );
  }
}

///{@template on_tap_post_card}
///Callback for when a post card is tapped
///{@endtemplate}
void onTapPostCard({
  required Post post,
  required bool isFavorite,
  required BuildContext context,
}) {
  Navigator.of(context).push(
    MaterialPageRoute<Widget>(
      builder: (_) => BlocProvider.value(
        value: BlocProvider.of<PostCubit>(context),
        child: PostDetailsPage(
          isFavorite: isFavorite,
          onTapStar: () => context.read<PostCubit>().addPostToFavorites(
                post: post,
              ),
          onTapDelete: () {
            showDialog<Widget>(
              context: context,
              builder: (_) => CustomDialog(
                title: 'Delete Alert',
                description:
                    '''This will be removed even from your favorites''',
                onTapConfirm: () {
                  Navigator.of(context).pop();
                  context.read<PostCubit>().deletePost(
                        post: post,
                      );
                },
              ),
            );
          },
          post: post,
        ),
      ),
    ),
  );
}
