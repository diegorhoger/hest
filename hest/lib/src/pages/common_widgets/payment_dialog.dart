import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../config/custom_colors.dart';
import '../../models/order_model.dart';
import '../../services/utils_services.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;

  PaymentDialog({Key? key, required this.order}) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Dialog Content
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Dialog Title
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Pagamento com PIX',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),

                // QR Code
                QrImage(
                  data: "sa1n3oqjne3ojcam13cmaosjf",
                  version: QrVersions.auto,
                  size: 200.0,
                ),

                // Payment Info
                Text(
                  'Vencimento: ${utilsServices.formatDateTime(order.createdDateTime)}',
                  style: const TextStyle(fontSize: 12),
                ),

                // Payment Total
                Text(
                  'Total: ${utilsServices.priceToCurrency(order.total)}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),

                // Copy Button
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        width: 2, color: CustomColors.customSwatchColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.copy, size: 16),
                  label: const Text('Copiar Chave PIX',
                      style: TextStyle(fontSize: 14)),
                ),
              ],
            ),
          ),

          // Close Button
          Positioned(
            top: 0,
            right: 0,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
