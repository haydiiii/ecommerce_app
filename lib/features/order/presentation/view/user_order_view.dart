import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/order/presentation/view/single_order_view.dart';
import 'package:ecommerce_app/features/order/presentation/view_model/cubit/order_cubit.dart';
import 'package:ecommerce_app/features/order/presentation/view_model/cubit/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserOrderView extends StatelessWidget {
  const UserOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit()..userOrders(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Orders',
            style: getTitleStyle(fontsize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        body: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            var cubit = OrderCubit.get(context);

            if (cubit.userOrdersModel == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.separated(
              itemCount: cubit.userOrdersModel!.data.length,
              itemBuilder: (context, index) {
                final order = cubit.userOrdersModel!.data[index];
                final address = order.addresse;
                final orderItems = order.orderItems;

                return ListTile(
                  onTap: () {
                    pushto(
                      context,
                      SingelOrderView(id: order.id),
                    );
                  },
                  title: Text(
                    "${address.firstName} ${address.lastName}, ${address.address}",
                    style: getBodyStyle(),
                  ),
                  subtitle: Text(
                    "Items: ${orderItems.length}",
                    style: getBodyStyle(),
                  ),
                  trailing: Text(
                    "Total: ${order.totalPrice} EGP",
                    style: getBodyStyle(),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  indent: 20,
                  endIndent: 20,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
