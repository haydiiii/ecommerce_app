import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/layouts/presentation/view/bottom_nav_bar.dart';
import 'package:ecommerce_app/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:ecommerce_app/features/profile/presentation/widgets/drawer_widget.dart';
import 'package:ecommerce_app/features/profile/presentation/widgets/list_tile_widget.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../view_model/profile_state.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..showProfile(),
      child: Scaffold(
        endDrawer: const DrawerWidget(), // استخدام const لتحسين الأداء
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.primaryColor),
          title: Text(
            S.of(context).profile, // استخدام الترجمة
            style: getTitleStyle(fontsize: 25, fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
            onPressed: () {
              pushAndRemoveUntil(context, const BottomNavBar());
            },
          ),
        ),
        body: BlocBuilder<ProfileCubit, ProfileStates>(
          builder: (context, state) {
            var cubit = ProfileCubit.get(context);
            if (state is ShowProfileLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            } else if (state is ShowProfileErrorState) {
              return Center(
                child: Text(
                  S.of(context).errorLoadingProfile(state.errorMessage), // استخدام الترجمة للنصوص الديناميكية
                  style: getBodyStyle(color: AppColors.primaryColor),
                ),
              );
            } else if (state is ShowProfileSuccessState) {
              return Stack(
                children: [
                  // Background decorative circles
                  Positioned(
                    top: -70,
                    left: 150,
                    child: ClipOval(
                      child: Container(
                        width: 400,
                        height: 430,
                        color: AppColors.primaryColor.withOpacity(0.2),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -70,
                    right: 150,
                    child: ClipOval(
                      child: Container(
                        width: 300,
                        height: 300,
                        color: AppColors.primaryColor.withOpacity(0.2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            cubit.showProfileModel?.data.imageUrl ?? '', // ضمان عدم وجود خطأ في حالة عدم وجود URL
                          ),
                        ),
                        const Gap(20),
                        ProfileInfoTile(
                          icon: Icons.person,
                          text: cubit.showProfileModel?.data.firstName ?? S.of(context).notAvailable, // التحقق من القيم الفارغة
                        ),
                        ProfileInfoTile(
                          icon: Icons.person,
                          text: cubit.showProfileModel?.data.lastName ?? S.of(context).notAvailable,
                        ),
                        ProfileInfoTile(
                          icon: Icons.email,
                          text: cubit.showProfileModel?.data.email ?? S.of(context).notAvailable,
                        ),
                        ProfileInfoTile(
                          icon: Icons.phone,
                          text: cubit.showProfileModel?.data.phone?.toString() ?? S.of(context).notAvailable,
                        ),
                        const Gap(20),
                        // أزرار التحديث وتسجيل الخروج
                        // CustomElvButton(
                        //   onPressed: () {
                        //     pushto(context, const UpdateProfilePage());
                        //   },
                        //   text: S.of(context).updateProfile,
                        //   width: 200,
                        // ),
                        const Gap(20),
                        // CustomElvButton(
                        //   onPressed: () async {
                        //     await CashHelper.removeData(key: 'token').then((value) {
                        //       pushAndRemoveUntil(context, const LoginView());
                        //     });
                        //   },
                        //   text: S.of(context).logout,
                        //   width: 200,
                        // ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text(S.of(context).noProfileDataAvailable), // استخدام الترجمة
              );
            }
          },
        ),
      ),
    );
  }
}
