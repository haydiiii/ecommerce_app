import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_elev_button.dart';
import 'package:ecommerce_app/features/auth/presentation/login/view/login_view.dart';
import 'package:ecommerce_app/features/onBoarding/presentation/view_model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  var pageController = PageController();
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            if ((index == 0))
              TextButton(
                onPressed: () {
                  pushAndRemoveUntil(context, const LoginView());
                },
                child: Text(
                  'Skip',
                  style:
                      getTitleStyle(fontsize: 25, fontWeight: FontWeight.w400),
                ),
              )
          ],
        ),
        body: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                index = value;
              });
            },
            controller: pageController,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(
                    pages[index].title,
                    style: getTitleStyle(fontsize: 30),
                  ),
                  const Gap(10),
                  Image.asset(
                    pages[index].image,
                    width: 250,
                    height: 250,
                  ),
                  const Spacer(),
                  Text(
                    pages[index].body,
                    style: getBodyStyle(
                      color: AppColors.black,
                      fontsize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(children: [
                      SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: const SlideEffect(
                            activeDotColor: AppColors.primaryColor,
                            dotHeight: 15,
                            dotWidth: 15),
                      ),
                      const Spacer(),
                      if (index == 2)
                        CustomElvButton(
                          onPressed: () {
                            pushAndRemoveUntil(context, const LoginView());
                          },
                          text: 'Let\'s go',
                          width: 120,
                        )
                    ]),
                  )
                ],
              );
            }));
  }
}
