import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/best_seller_widget.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/carousal_slider_wid.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/all_categories_widget.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/hot_product_widget.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/new_product_widget.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/top_product.dart';
import 'package:ecommerce_app/generated/l10n.dart';
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
          ..fetchHomeData()
          ..getAllCategories()
          ..getCarousel();
        //     ..getNewProducts()
        //     // ..getbestSeller()
        //     ..getTopProducts()
        //     ..getHproducts();
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CarouselSliderWid(),
                  const Gap(10),
                  Text(
                    S.of(context).allCategories,
                    style: getTitleStyle(color: AppColors.black, fontsize: 20),
                  ),
                  const CategoryWidget(),
                  const Gap(10),
                  Text(
                    S.of(context).newProducts,
                    style: getTitleStyle(color: AppColors.black, fontsize: 20),
                  ),
                  const NewProductsWidget(),
                  const Gap(10),
                  Text(
                    S.of(context).topProducts,
                    style: getTitleStyle(color: AppColors.black, fontsize: 20),
                  ),
                  const TopProductWidget(),
                  const Gap(10),
                  Text(
                    S.of(context).hotProducts,
                    style: getTitleStyle(color: AppColors.black, fontsize: 20),
                  ),
                  const HotProductWidget(),
                  const Gap(10),
                  Text(
                    S.of(context).bestSellers,
                    style: getTitleStyle(color: AppColors.black, fontsize: 20),
                  ),
                  const BestSellerWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
