import 'package:ecommerce_app/core/constants/images/icon_assets.dart';
import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/services/dio_helper/token.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/layouts/presentation/view/bottom_nav_bar.dart';
import 'package:ecommerce_app/features/onBoarding/presentation/view/onboard_vie.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  //Widget? nextScreen;

  @override
  void initState() {
    //bool isUpload = AppLocalStorage.getCashData('isUploaded') ?? false;
    super.initState();
    // bool? onBoard = CashHelper.getData('onBoard');
    // String? token = CashHelper.getData('token');
    // if (onBoard != null) {
    //   if (token != null) {
    //     nextScreen = const HomeView();
    //   } else {
    //     nextScreen = const LoginView();
    //   }
    // } else {
    //   nextScreen = const OnBoardView();
    // }

    Future.delayed(const Duration(seconds: 4), () {
      pushAndRemoveUntil(
          BuildContext,
          Token.getBearerToken() == null || Token.getBearerToken() == ''
              ? const OnBoardView()
              : const BottomNavBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppIcons.logoApp, height: 250, width: 250),
              const Gap(20),
              const Gap(10),
              Text(
                'Shoppe',
                style: getTitleStyle(color: AppColors.black),
              ),
              Text(
                S.of(context).description,
                textAlign: TextAlign.center,
                style: getBodyStyle(color: AppColors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
