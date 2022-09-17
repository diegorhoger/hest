import 'package:flutter/material.dart';

import '../../../config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({
    Key? key,
    required this.status,
    required this.isOverdue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(
          title: 'Pedido Confirmado',
          isActive: true,
        ),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          const _StatusDot(
            title: 'Pagamento Estornado',
            isActive: true,
            backgroundColor: Colors.red,
          ),
        ] else if (isOverdue) ...[
          const _StatusDot(
            title: 'Pagamento por PIX Vencido',
            isActive: true,
            backgroundColor: Colors.purple,
          ),
        ] else ...[
          // Payment Confirmed
          _StatusDot(
            title: 'Pagamento Confirmado',
            isActive: currentStatus >= 2,
            backgroundColor: Colors.green,
          ),

          const _CustomDivider(),

          // Preparing Purchase
          _StatusDot(
            title: 'Preparando Pedido',
            isActive: currentStatus >= 3,
          ),

          const _CustomDivider(),

          // Shipping Purchase
          _StatusDot(
            title: 'Pedido Enviado',
            isActive: currentStatus >= 4,
          ),

          const _CustomDivider(),

          // Delivered Purchase
          _StatusDot(
            title: 'Pedido Entregue',
            isActive: currentStatus == 5,
          ),
        ],
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 1,
      ),
      height: 10,
      width: 2,
      color: Colors.black26,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? backgroundColor;

  const _StatusDot({
    Key? key,
    required this.isActive,
    required this.title,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dot
        Container(
          alignment: Alignment.center,
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black26,
            ),
            color: isActive
                ? backgroundColor ?? CustomColors.customSwatchColor
                : Colors.transparent,
          ),
          child: isActive
              ? const Icon(Icons.check, size: 8, color: Colors.white)
              : const SizedBox.shrink(),
        ),
        const SizedBox(width: 8),
        // Status Text
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
