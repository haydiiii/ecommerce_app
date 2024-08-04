import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/services/dio_helper/cash_helper.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_elev_button.dart';
import 'package:ecommerce_app/features/auth/presentation/login/view/login_view.dart';
import 'package:ecommerce_app/features/profile/presentation/view/update_profile.dart';
import 'package:ecommerce_app/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:ecommerce_app/features/profile/presentation/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../view_model/profile_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..showProfile(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: getTitleStyle(fontsize: 25, fontWeight: FontWeight.w500),
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
                  'Error loading profile: ${state.errorMessage}',
                  style: getBodyStyle(color: AppColors.primaryColor),
                ),
              );
            } else if (state is ShowProfileSuccessState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: cubit.showProfileModel?.data.imageUrl !=
                              null
                          ? NetworkImage(cubit.showProfileModel!.data.imageUrl!)
                          : const AssetImage('assets/placeholder.jpg')
                              as ImageProvider,
                    ),
                    const Gap(20),
                    ProfileInfoTile(
                      icon: Icons.person,
                      text: cubit.showProfileModel!.data.firstName,
                    ),
                    ProfileInfoTile(
                      icon: Icons.person,
                      text: cubit.showProfileModel!.data.lastName,
                    ),
                    ProfileInfoTile(
                      icon: Icons.email,
                      text: cubit.showProfileModel!.data.email,
                    ),
                    ProfileInfoTile(
                      icon: Icons.phone,
                      text: cubit.showProfileModel!.data.phone?.toString() ?? 'N/A',
                    ),
                    const Gap(20),
                    CustomElvButton(
                      onPressed: () {
                        pushto(context, const UpdateProfilePage());
                      },
                      text: 'Update Profile',
                      width: 200,
                    ),
                    const Gap(20),
                    CustomElvButton(
                      onPressed: () async {
                        await CashHelper.removeData(key: 'token').then((value) {
                          pushAndRemoveUntil(context, const LoginView());
                        });
                      },
                      text: 'Logout',
                      width: 200,
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('No profile data available'),
              );
            }
          },
        ),
      ),
    );
  }
}
