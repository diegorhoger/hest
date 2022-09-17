import 'package:flutter/material.dart';

import 'package:hest/src/config/custom_colors.dart';
import 'package:hest/src/config/app_data.dart' as app_data;

import 'components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // AppBar Top Navigation
        appBar: AppBar(
          title: const Text('Pedidos'),
          centerTitle: true,
          backgroundColor: CustomColors.customSwatchColor,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (_, index) => const SizedBox(height: 16),
          itemBuilder: (_, index) => OrderTile(order: app_data.orders[index]),
          itemCount: app_data.orders.length,
        ));
  }
}
