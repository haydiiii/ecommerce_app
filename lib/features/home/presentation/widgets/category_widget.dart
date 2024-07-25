import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (BuildContext context, HomeStates state) {
          var cubit = HomeCubit.get(context);
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeErrorState) {
            return const Center(
              child: Text('Failed to load categories'),
            );
          } else if (cubit.allCategories.isEmpty) {
            return const Center(
              child: Text('No categories available'),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.allCategories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Opacity(
                          opacity: 0.8,
                          child: Image.network(
                            cubit.allCategories[index].image,
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Center(
                          child: Text(
                            cubit.allCategories[index].name,
                            style: getBodyStyle(
                                color: AppColors.white,
                                fontsize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
