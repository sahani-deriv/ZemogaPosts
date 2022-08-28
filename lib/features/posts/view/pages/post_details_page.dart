import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_api_client/posts_api_client.dart';
import 'package:zemoga_posts/app/theme/colors.dart';
import 'package:zemoga_posts/app/theme/text_styles.dart';

///{@template post_details_page}
///Page that displays details of a post
///{@endtemplate}
class PostDetailsPage extends StatelessWidget {
  ///{@macro post_details_page}
  const PostDetailsPage({
    super.key,
    required this.post,
    required this.onTapStar,
    required this.onTapDelete,
    required this.isFavorite,
  });

  ///Represents the post to be displayed.
  final Post post;

  ///Callback method that is called when the star is clicked.
  final VoidCallback onTapStar;

  ///Callback method that is called when the delete is clicked.
  final VoidCallback onTapDelete;

  ///Represents whether the post is favorite or not.
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.chevron_left,
                      size: 24.h,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: onTapDelete,
                    child: Icon(
                      Icons.delete,
                      size: 24.h,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: onTapStar,
                    child: isFavorite
                        ? Icon(
                            Icons.star,
                            size: 24.h,
                            color: CustomColor.blue90,
                          )
                        : Icon(
                            Icons.star_border,
                            size: 24.h,
                            color: CustomColor.blue90,
                          ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Text(
                  post.title,
                  style: CustomTextStyles.mediumText16,
                ),
              ),
              Text(
                post.body,
                style: CustomTextStyles.regularText14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
