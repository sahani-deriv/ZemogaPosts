import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zemoga_posts/app/theme/text_styles.dart';

///{@template posts_card}
///Card that displays a post
///{@endtemplate}
class PostCard extends StatelessWidget {
  ///{@macro posts_card}
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.star,
            size: 24.h,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Text(
              'Title of the post',
              style: CustomTextStyles.regularText14,
            ),
          ),
          Icon(
            Icons.chevron_right_outlined,
            size: 24.h,
          )
        ],
      ),
    );
  }
}
