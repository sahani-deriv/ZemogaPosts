import 'package:flutter/material.dart';
import 'package:zemoga_posts/app/theme/colors.dart';
import 'package:zemoga_posts/app/theme/text_styles.dart';

///{@template app_tab_view}
/// Customized tab view for the app.
/// {@endtemplate}
class AppTabView extends StatelessWidget {
  ///{@macro app_tab_view}
  const AppTabView({
    this.title,
    required this.tabs,
    required this.pages,
    this.onTab,
  });

  /// The title of the tab view.
  final String? title;

  /// The tabs of the tab view.
  final List<Tab> tabs;

  /// The pages of the tab view.
  final List<Widget> pages;

  /// The callback when a tab is selected.
  final void Function(int)? onTab;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CustomColor.white,
        appBar: AppBar(
          backgroundColor: CustomColor.white,
          elevation: 1,
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicator: const CustomTabIndicator(
                  indicatorColor: CustomColor.black25,
                  indicatorHeight: 4,
                  cornerRadius: 4,
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
      ),
    );
  }
}

///{@template custom_tab_indicator}
/// Customized tab indicator for the app.
/// {@endtemplate}
class CustomTabIndicator extends Decoration {
  ///{@macro custom_tab_indicator}
  const CustomTabIndicator({
    required this.indicatorHeight,
    required this.indicatorColor,
    required this.cornerRadius,
  });

  /// height of the indicator
  final double indicatorHeight;

  /// color of the indicator
  final Color? indicatorColor;

  /// corner radius of the indicator
  final double cornerRadius;

  @override
  _CustomTabBarIndicatorPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabBarIndicatorPainter(this, onChanged);
  }
}

class _CustomTabBarIndicatorPainter extends BoxPainter {
  _CustomTabBarIndicatorPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);
  final CustomTabIndicator decoration;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    late Rect rect;

    rect = Offset(
          offset.dx + 6,
          configuration.size!.height - decoration.indicatorHeight,
        ) &
        Size(configuration.size!.width - 12, decoration.indicatorHeight);

    final paint = Paint()
      ..color = decoration.indicatorColor ?? const Color(0xff1967d2)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topRight: Radius.circular(decoration.cornerRadius),
        topLeft: Radius.circular(decoration.cornerRadius),
        bottomLeft: Radius.circular(decoration.cornerRadius),
        bottomRight: Radius.circular(decoration.cornerRadius),
      ),
      paint,
    );
  }
}
