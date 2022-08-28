import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zemoga_posts/features/posts/view/widgets/post_card.dart';

///{@template posts_tab}
///Tab view that displays list of posts
///{@endtemplate}
class PostsTab extends StatelessWidget {
  ///{@macro posts_tab}
  const PostsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const PostCard();
        },
      ),
    );
  }
}
