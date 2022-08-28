import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zemoga_posts/app/theme/colors.dart';
import 'package:zemoga_posts/features/posts/cubit/post_cubit.dart';
import 'package:zemoga_posts/features/posts/view/pages/post_details_page.dart';
import 'package:zemoga_posts/features/posts/view/widgets/post_card.dart';

///{@template posts_tab}
///Tab view that displays list of posts
///{@endtemplate}
class PostsTab extends StatelessWidget {
  ///{@macro posts_tab}
  const PostsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    height: 1.h,
                    color: CustomColor.black25,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.favoritePosts.length,
                  itemBuilder: (context, index) {
                    return PostCard(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<Widget>(
                          builder: (_) => PostDetailsPage(
                            isFavorite: true,
                            onTapStar: () => context
                                .read<PostCubit>()
                                .removePostFromFavorites(
                                  post: state.favoritePosts[index],
                                ),
                            onTapDelete: () =>
                                context.read<PostCubit>().deletePost(
                                      post: state.favoritePosts[index],
                                    ),
                            post: state.favoritePosts[index],
                          ),
                        ),
                      ),
                      isFavorite: true,
                      title: state.favoritePosts[index].title,
                    );
                  },
                ),
                if (state.posts.isEmpty)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      child: const Text('No favorites yet'),
                    ),
                  )
                else
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      return PostCard(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute<Widget>(
                            builder: (_) => PostDetailsPage(
                              isFavorite: false,
                              onTapStar: () =>
                                  context.read<PostCubit>().addPostToFavorites(
                                        post: state.posts[index],
                                      ),
                              onTapDelete: () =>
                                  context.read<PostCubit>().deletePost(
                                        post: state.posts[index],
                                      ),
                              post: state.posts[index],
                            ),
                          ),
                        ),
                        isFavorite: false,
                        title: state.posts[index].title,
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      height: 1.h,
                      color: CustomColor.black25,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
