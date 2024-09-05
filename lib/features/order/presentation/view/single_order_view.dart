import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/order/presentation/models/single_order.dart';
import 'package:ecommerce_app/features/order/presentation/view_model/cubit/order_cubit.dart';
import 'package:ecommerce_app/features/order/presentation/view_model/cubit/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class SingelOrderView extends StatelessWidget {
  const SingelOrderView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit()..singleOrder(id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Single Order',
            style: getTitleStyle(fontsize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        body: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            var singleOrderCubit = OrderCubit.get(context);

            // Display a loading indicator while the data is being fetched
            if (state is OrderLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            // Handle error state
            if (state is OrderErrorState) {
              return Center(child: Text('Error: ${state.error}'));
            }

            if (singleOrderCubit.singleOrderModel != null) {
              var orderData = singleOrderCubit.singleOrderModel!.data;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleOrderItem(
                      title: 'Status',
                      icon: Icons.info,
                      text: orderData.status,
                    ),
                    const Gap(10),
                    SingleOrderItem(
                      title: 'Address',
                      icon: Icons.location_on,
                      text:
                          '${orderData.address.firstName} ${orderData.address.lastName}, ${orderData.address.address}, ${orderData.address.country}',
                    ),
                    const Gap(10),
                    Text('Order Items:',
                        style: getTitleStyle(fontWeight: FontWeight.bold)),
                    const Gap(10),
                    ...orderData.orderItems.map((item) {
                      return OrderItemWidget(item: item);
                    }),
                    const Gap(10),
                    Row(
                      children: [
                        Text('Total Price: ',
                            style: getTitleStyle(fontWeight: FontWeight.bold)),
                        Text('${orderData.totalPrice} L.E',
                            style:
                                getTitleStyle(color: AppColors.primaryColor)),
                      ],
                    ),
                  ],
                ),
              );
            }

            // Return an empty container if data is null
            return const Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }
}

class SingleOrderItem extends StatelessWidget {
  const SingleOrderItem({
    super.key,
    required this.text,
    required this.icon,
    required this.title,
  });

  final String title;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: getBodyStyle(fontWeight: FontWeight.bold)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primaryColor),
            const Gap(10),
            Expanded(
              child: Text(
                text,
                style: getBodyStyle(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const Gap(25),
      ],
    );
  }
}

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({super.key, required this.item});

  final OrderItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Image.network(
            item.product.imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.product.name,
                    style: getBodyStyle(fontWeight: FontWeight.bold)),
                Text('Quantity: ${item.quantity}', style: getBodyStyle()),
                Text('Price: ${item.totalPrice} L.E', style: getBodyStyle()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
