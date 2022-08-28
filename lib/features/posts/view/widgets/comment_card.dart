import 'package:flutter/material.dart';
import 'package:zemoga_posts/app/theme/text_styles.dart';

///{@template comment_card}
/// A customized comment card for this app.
/// {@endtemplate}
class CommentCard extends StatelessWidget {
  ///{@macro comment_card}
  const CommentCard({
    super.key,
    required this.email,
    required this.name,
    required this.comment,
  });

  /// Email of the comment.
  final String email;

  /// Name of the comment.
  final String name;

  /// Comment to be displayed.
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          email,
          style: CustomTextStyles.boldText16,
        ),
        Text(
          name,
          style: CustomTextStyles.boldText14,
        ),
        Text(
          comment,
          style: CustomTextStyles.regularText14,
        )
      ],
    );
  }
}
