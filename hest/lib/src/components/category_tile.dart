import 'package:flutter/material.dart';

import '../config/custom_colors.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
          ),
          child: Text(category,
              style: TextStyle(
                  color: isSelected
                      ? CustomColors.customSwatchColor
                      : Colors.black45,
                  fontSize: isSelected ? 16 : 14,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
