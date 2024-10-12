import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/services/dio_helper/cash_helper.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/auth/presentation/login/view/login_view.dart';
import 'package:ecommerce_app/features/order/presentation/view/user_order_view.dart';
import 'package:ecommerce_app/features/profile/presentation/model/show_profile_model.dart';
import 'package:ecommerce_app/features/profile/presentation/view/update_profile.dart';
import 'package:ecommerce_app/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:ecommerce_app/features/profile/presentation/view_model/profile_state.dart';
import 'package:ecommerce_app/features/profile/presentation/widgets/changeLanguage/showlanguagedialog.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        // Fetch profile data from cubit
        ApiResponse? profile = ProfileCubit.get(context).showProfileModel;

        // Conditional rendering based on profile data availability
        return profile != null
            ? Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(
                      decoration:
                          const BoxDecoration(color: AppColors.primaryColor),
                      accountName: Text(
                        '${profile.data.firstName} ${profile.data.lastName}',
                        style: getSmallStyle(
                          TextDecoration.none,
                          color: AppColors.white,
                        ),
                      ),
                      accountEmail: Text(
                        profile.data.email,
                        style: getSmallStyle(TextDecoration.none,
                            color: AppColors.white),
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: profile.data.imageUrl != null
                            ? NetworkImage(profile.data.imageUrl!)
                            : const AssetImage('assets/placeholder.jpg')
                                as ImageProvider,
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.history,
                        color: AppColors.pinkColor,
                      ),
                      title: Text(
                        S.of(context).orderHistory, // استخدام الترجمة
                        style: const TextStyle(color: AppColors.primaryColor),
                      ),
                      onTap: () {
                        pushto(context, const UserOrderView());
                      },
                    ),
                    ListTile(
                      leading:
                          const Icon(Icons.update, color: AppColors.pinkColor),
                      title: Text(
                        S.of(context).updateProfile, // استخدام الترجمة
                        style: const TextStyle(color: AppColors.primaryColor),
                      ),
                      onTap: () {
                        pushto(context, const UpdateProfilePage());
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.language,
                        color: AppColors.pinkColor,
                      ),
                      title: Text(
                        S.of(context).changeLanguage, // استخدام الترجمة
                        style: const TextStyle(color: AppColors.primaryColor),
                      ),
                      onTap: () {
                        showLanguageDialog(context);
                        // pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.logout,
                        color: AppColors.pinkColor,
                      ),
                      title: Text(
                        S.of(context).logout, // استخدام الترجمة
                        style: const TextStyle(color: AppColors.primaryColor),
                      ),
                      onTap: () async {
                        await CashHelper.removeData(key: 'token').then((value) {
                          pushAndRemoveUntil(BuildContext, const LoginView());
                        });
                      },
                    ),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
