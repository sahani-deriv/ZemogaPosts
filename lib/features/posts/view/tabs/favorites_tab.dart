import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zemoga_posts/app/theme/colors.dart';
import 'package:zemoga_posts/features/posts/cubit/post_cubit.dart';
import 'package:zemoga_posts/features/posts/view/widgets/functional_post_card.dart';

///{@template favorites_tab}
///Tab view that displays list of favorites posts
///{@endtemplate}
class FavoritesTab extends StatelessWidget {
  ///{@macro favorites_tab}
  const FavoritesTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.favoritePosts.isEmpty)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      child: const Text('No favorites yet'),
                    ),
                  )
                else
                  ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      height: 1.h,
                      color: CustomColor.black25,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.favoritePosts.length,
                    itemBuilder: (context, index) {
                      return FunctionalPostCard(
                        post: state.favoritePosts[index],
                        isFavorite: true,
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
