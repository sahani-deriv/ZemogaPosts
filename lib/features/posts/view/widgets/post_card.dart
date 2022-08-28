import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zemoga_posts/app/theme/text_styles.dart';

///{@template posts_card}
///Card that displays a post
///{@endtemplate}
class PostCard extends StatelessWidget {
  ///{@macro posts_card}
  const PostCard({
    super.key,
    required this.isFavorite,
    required this.title,
    required this.onTap,
  });

  ///Represents whether the post is favorite or not.
  final bool isFavorite;

  ///Represents the title of the post.
  final String title;

  ///Callback method that is called when the post is clicked.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isFavorite)
              Icon(
                Icons.star,
                size: 24.h,
              ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Text(
                title,
                style: CustomTextStyles.regularText14,
              ),
            ),
            Icon(
              Icons.chevron_right_outlined,
              size: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
