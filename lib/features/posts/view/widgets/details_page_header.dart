import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zemoga_posts/app/theme/colors.dart';

///{@template details_page_header}
///Header of the post details page
///{@endtemplate}
class DetailsPageHeader extends StatelessWidget {
  ///{@macro details_page_header}
  const DetailsPageHeader({
    super.key,
    required this.onTapStar,
    required this.onTapDelete,
    required this.isFavorite,
  });

  ///Callback method that is called when the star is clicked.
  final VoidCallback onTapStar;

  ///Callback method that is called when the delete is clicked.
  final VoidCallback onTapDelete;

  ///Represents whether the post is favorite or not.
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    final _isFavoriteNotifier = ValueNotifier<bool>(isFavorite);
    return Row(
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
        ValueListenableBuilder<bool>(
          valueListenable: _isFavoriteNotifier,
          builder: (context, value, _) {
            return GestureDetector(
              onTap: () {
                _isFavoriteNotifier.value = !value;
                onTapStar();
              },
              child: value
                  ? Icon(
                      Icons.star,
                      size: 24.h,
                      color: AppColor.blue90,
                    )
                  : Icon(
                      Icons.star_border,
                      size: 24.h,
                      color: AppColor.blue90,
                    ),
            );
          },
        ),
      ],
    );
  }
}
