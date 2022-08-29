import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_api_client/posts_api_client.dart';
import 'package:zemoga_posts/app/theme/styles.dart';
import 'package:zemoga_posts/features/posts/cubit/post_cubit.dart';
import 'package:zemoga_posts/features/posts/view/widgets/comment_card.dart';
import 'package:zemoga_posts/features/posts/view/widgets/details_page_header.dart';

///{@template post_details_page}
///Page that displays details of a post
///{@endtemplate}
class PostDetailsPage extends StatefulWidget {
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
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostCubit>().getCommentsByPost(postId: widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailsPageHeader(
                  onTapStar: widget.onTapStar,
                  onTapDelete: widget.onTapDelete,
                  isFavorite: widget.isFavorite,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Text(
                    widget.post.title,
                    style: AppTextStyle.boldText20,
                  ),
                ),
                Text(
                  widget.post.body,
                  style: AppTextStyle.regularText14,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: const Divider(),
                ),
                Text('Comments', style: AppTextStyle.boldText20),
                BlocBuilder<PostCubit, PostState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      success: (_, __, comments) => (comments == null ||
                              comments.isEmpty)
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: const Text('No comments'),
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: comments.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child: CommentCard(
                                    email: comments[index].email,
                                    name: comments[index].name,
                                    comment: comments[index].body,
                                  ),
                                );
                              },
                            ),
                      orElse: Container.new,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
