import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zemoga_posts/app/components/components.dart';
import 'package:zemoga_posts/app/theme/colors.dart';
import 'package:zemoga_posts/app/theme/styles.dart';

///{@template app_tab_view}
/// Customized tab view for the app.
/// {@endtemplate}
class AppTabView extends StatelessWidget {
  ///{@macro app_tab_view}
  const AppTabView({
    super.key,
    required this.title,
    required this.tabs,
    required this.pages,
    this.onTab,
    required this.onTapDelete,
  });

  /// The title of the tab view.
  final String title;

  /// The tabs of the tab view.
  final List<Tab> tabs;

  /// The pages of the tab view.
  final List<Widget> pages;

  /// The callback when a tab is selected.
  final void Function(int)? onTab;

  ///The callback called when a delete icon is tapped.
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColor.white,
        appBar: ZemogaAppBar(
          onTapDelete: onTapDelete,
          title: title,
          child: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.h),
            ),
            onTap: onTab,
            isScrollable: true,
            tabs: tabs,
            physics: const BouncingScrollPhysics(),
            labelColor: AppColor.blue90,
            labelStyle: AppTextStyle.mediumText14,
            unselectedLabelStyle: AppTextStyle.mediumText14,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        body: TabBarView(
          children: pages,
        ),
      ),
    );
  }
}
