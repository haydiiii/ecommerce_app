import 'package:ecommerce_app/core/constants/images/icon_assets.dart';
import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/onBoarding/presentation/view/onboard_vie.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    //bool isUpload = AppLocalStorage.getCashData('isUploaded') ?? false;

    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      pushWithReplacement(context, const OnBoardView());
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
                'Beautiful eCommerce UI Kit \n for your online store',
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
