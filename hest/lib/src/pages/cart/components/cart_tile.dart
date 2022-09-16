import 'package:flutter/material.dart';

import '../../../config/custom_colors.dart';
import '../../../models/cart_item_model.dart';
import '../../../services/utils_services.dart';
import '../../common_widgets/quantity_widget.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;

  const CartTile({
    Key? key,
    required this.cartItem,
    required this.remove,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        // Product Image
        leading: Image.asset(
          widget.cartItem.item.image,
          width: 50,
          height: 50,
        ),

        // Product Name
        title: Text(widget.cartItem.item.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

        // Product Quantity
        trailing: QuantityWidget(
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;

              if (quantity == 0) {
                // Remove item from Cart
                widget.remove(widget.cartItem);
              }
            });
          },
          isRemovable: true,
        ),

        // Subtotal
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: CustomColors.customSwatchColor,
          ),
        ),
      ),
    );
  }
}
