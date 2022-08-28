import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zemoga_posts/app/theme/colors.dart';
import 'package:zemoga_posts/app/theme/text_styles.dart';

///{@template app_tab_view}
/// Customized tab view for the app.
/// {@endtemplate}
class AppTabView extends StatelessWidget {
  ///{@macro app_tab_view}
  const AppTabView({
    super.key,
    this.title,
    required this.tabs,
    required this.pages,
    this.onTab,
    required this.onTapRefresh,
    required this.onTapDelete,
  });

  /// The title of the tab view.
  final String? title;

  /// The tabs of the tab view.
  final List<Tab> tabs;

  /// The pages of the tab view.
  final List<Widget> pages;

  /// The callback when a tab is selected.
  final void Function(int)? onTab;

  ///The callback called when a refresh icon is tapped.
  final VoidCallback onTapRefresh;

  ///The callback called when a delete icon is tapped.
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CustomColor.white,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.refresh,
                size: 24.h,
              ),
              color: CustomColor.blue90,
              onPressed: onTapRefresh,
            ),
          ],
          backgroundColor: CustomColor.white,
          elevation: 1,
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2.h),
                ),

                onTap: onTab,
                isScrollable: true,
                // labelPadding: EdgeInsets.only(left: 16.w, right: 20.w),
                tabs: tabs,
                physics: const BouncingScrollPhysics(),
                labelColor: CustomColor.blue90,
                labelStyle: CustomTextStyles.mediumText14,
                unselectedLabelStyle: CustomTextStyles.mediumText14,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
          ),
          title: Text(
            title ?? '',
            style: CustomTextStyles.mediumText20
                .copyWith(color: CustomColor.blue90),
          ),
        ),
        body: TabBarView(
          children: pages,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: onTapDelete,
          backgroundColor: CustomColor.black25,
          child: Icon(
            Icons.delete,
            size: 24.h,
          ),
        ),
      ),
    );
  }
}
