import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/carousal_slider_wid.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/category_widget.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/new_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return HomeCubit()
          ..getAllCategories()
          ..getCarousel();
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CarouselSliderWid(),
              const Gap(10),
              Text(
                'All Categories',
                style: getTitleStyle(color: AppColors.black, fontsize: 20),
              ),
              const CategoryWidget(),
              const Gap(10),
              Text(
                'New Products',
                style: getTitleStyle(color: AppColors.black, fontsize: 20),
              ),
              const NewProductsWidget()
            ]),
          ),
        ),
      ),
    );
  }
}
