import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: getTitleStyle(color: AppColors.primaryColor, fontsize: 20),
        ),
      ),
      // body: BlocBuilder<ProductCubit, ProductState>(
      //   builder: (context, state) {
      //     var cubit = ProductCubit.get(context);
      //     if (state is ProductLoadingState) {
      //       return const Center(
      //         child: CircularProgressIndicator(
      //           color: AppColors.primaryColor,
      //         ),
      //       );
      //     } else if (state is ProductErrorState) {
      //       return Center(
      //         child: Text(state.error),
      //       );
      //     } else if (state is ProductSuccessState) {
      //       return ListView.builder(
      //         itemCount: cubit.products.length,
      //         itemBuilder: (context, index) {
      //           var product = cubit.products[index];
      //           return Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Card(
      //               elevation: 5,
      //               child: Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     ClipRRect(
      //                       borderRadius: BorderRadius.circular(10),
      //                       child: Image.network(
      //                         product.imageUrl,
      //                         height: 150,
      //                         width: double.infinity,
      //                         fit: BoxFit.cover,
      //                       ),
      //                     ),
      //                     const Gap(8),
      //                     Text(product.name, style: getBodyStyle()),
      //                     const Gap(8),
      //                     Text(
      //                       product.description,
      //                       maxLines: 2,
      //                       overflow: TextOverflow.ellipsis,
      //                       style: TextStyle(
      //                         color: Colors.grey[600],
      //                       ),
      //                     ),
      //                     const Gap(8),
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         if (product.comparePrice == null &&
      //                             product.comparePrice == 0) ...[
      //                           Text(
      //                             '\$${product.comparePrice}',
      //                             style: getSmallStyle(
      //                               null,
      //                               color: AppColors.black,
      //                               fontsize: 15,
      //                               fontWeight: FontWeight.bold,
      //                             ),
      //                           ),
      //                           Text(
      //                             '\$${product.price}',
      //                             style: getSmallStyle(
      //                               TextDecoration.lineThrough,
      //                               color: AppColors.greyColor,
      //                               fontsize: 15,
      //                               fontWeight: FontWeight.bold,
      //                             ),
      //                           ),
      //                         ] else ...[
      //                           Text(
      //                             '\$${product.price}',
      //                             style: getSmallStyle(
      //                               TextDecoration.none,
      //                               color: AppColors.primaryColor,
      //                               fontsize: 15,
      //                               fontWeight: FontWeight.bold,
      //                             ),
      //                           ),
      //                         ],
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       );
      //     } else {
      //       return const Center(
      //         child: Text('No products available'),
      //       );
      //     }
      //   },
      // ),
    );
  }
}
