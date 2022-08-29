import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zemoga_posts/app/theme/colors.dart';
import 'package:zemoga_posts/features/posts/cubit/post_cubit.dart';
import 'package:zemoga_posts/features/posts/view/widgets/functional_post_card.dart';

///{@template posts_tab}
///Tab view that displays list of posts
///{@endtemplate}
class PostsTab extends StatelessWidget {
  ///{@macro posts_tab}
  const PostsTab({
    super.key,
    required this.onTapRefresh,
  });

  /// The callback when the refresh icon is tapped.
  final VoidCallback onTapRefresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: onTapRefresh,
        backgroundColor: AppColor.black,
        child: Icon(
          Icons.refresh,
          size: 24.h,
          color: AppColor.white,
        ),
      ),
      body: BlocBuilder<PostCubit, PostState>(
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
                      color: AppColor.black25,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.favoritePosts.length,
                    itemBuilder: (context, index) {
                      return PostCardWidget(
                        isFavorite: true,
                        post: state.favoritePosts[index],
                      );
                    },
                  ),
                  if (state.posts.isEmpty)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.h),
                        child: const Text('No posts yet please refresh.'),
                      ),
                    )
                  else
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        return PostCardWidget(
                          post: state.posts[index],
                          isFavorite: false,
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        height: 1.h,
                        color: AppColor.black25,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
