import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_api_client/posts_api_client.dart';
import 'package:zemoga_posts/app/theme/colors.dart';
import 'package:zemoga_posts/features/posts/view/pages/post_details_page.dart';
import 'package:zemoga_posts/features/posts/view/widgets/post_card.dart';

///{@template posts_tab}
///Tab view that displays list of posts
///{@endtemplate}
class PostsTab extends StatelessWidget {
  ///{@macro posts_tab}
  const PostsTab({super.key, required this.posts, required this.favoritePosts});

  ///Represents list of formal posts.
  final List<Post> posts;

  ///Represents list of favorite posts.
  final List<Post> favoritePosts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: favoritePosts.length,
            itemBuilder: (context, index) {
              return PostCard(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<Widget>(
                    builder: (context) => const PostDetailsPage(),
                  ),
                ),
                isFavorite: true,
                title: favoritePosts[index].title,
              );
            },
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostCard(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<Widget>(
                      builder: (context) => const PostDetailsPage(),
                    ),
                  ),
                  isFavorite: false,
                  title: posts[index].title,
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 1.h,
                color: CustomColor.black25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
