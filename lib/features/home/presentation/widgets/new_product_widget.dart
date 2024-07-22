import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewProductsWidget extends StatelessWidget {
  const NewProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
          height: 100,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Gap(5);
              },
              separatorBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/watches.jpg',
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              )),
                          Text('Brand Name',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: getBodyStyle(
                                  color: AppColors.black,
                                  fontsize: 15,
                                  fontWeight: FontWeight.bold)),
                          Text('Main Name',
                              overflow: TextOverflow.ellipsis,
                              style: getBodyStyle(
                                  color: AppColors.greyColor,
                                  fontsize: 15,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ));
              },
              itemCount: 5)),
    );
  }
}
