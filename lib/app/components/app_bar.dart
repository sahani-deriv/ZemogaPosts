import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zemoga_posts/app/theme/theme.dart';

/// {@template zemoga_app_bar}
/// The primary app bar for the app.
/// {@endtemplate}
class ZemogaAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// {@macro zemoga_app_bar}
  const ZemogaAppBar({
    super.key,
    required this.onTapDelete,
    required this.child,
    required this.title,
  });

  /// The callback called when the refresh icon is tapped.
  final VoidCallback onTapDelete;

  /// Custom widget for the app bar.
  final Widget child;

  /// The title of the app bar.
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.delete, size: 24.h),
          color: AppColor.blue90,
          onPressed: onTapDelete,
        ),
      ],
      backgroundColor: AppColor.white,
      elevation: 1,
      centerTitle: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Align(
          alignment: Alignment.centerLeft,
          child: child,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyle.mediumText20.copyWith(color: AppColor.blue90),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 36.h);
}
