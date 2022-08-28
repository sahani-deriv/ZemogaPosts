import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zemoga_posts/app/theme/text_styles.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.chevron_left,
                  size: 24.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Text(
                    'Post Details',
                    style: CustomTextStyles.regularText14,
                  ),
                ),
                Icon(
                  Icons.chevron_right_outlined,
                  size: 24.h,
                ),
              ],
            ),
            const Center(
              child: Text('Post Details'),
            ),
          ],
        ),
      ),
    );
  }
}
