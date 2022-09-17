import 'package:flutter/material.dart';

import '../config/custom_colors.dart';
import '../models/item_model.dart';
import '../pages/product/product_screen.dart';
import '../services/utils_services.dart';

class ItemTile extends StatefulWidget {
  final ItemModel item;
  final void Function(GlobalKey) cartAnimationMethod;

  const ItemTile(
      {Key? key, required this.item, required this.cartAnimationMethod})
      : super(key: key);

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final GlobalKey imageGk = GlobalKey();

  final UtilsServices utilsServices = UtilsServices();

  IconData addIcon = Icons.add;

  Future<void> switchAddIcon() async {
    setState(() => addIcon = Icons.check);
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() => addIcon = Icons.add);
  }

  IconData favIcon = Icons.favorite_outline;

  Future<void> switchFavIcon() async {
    setState(() => favIcon = Icons.favorite);
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() => favIcon = Icons.favorite_outline);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Product Card

        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProductScreen(item: widget.item);
            }));
          },
          child: Card(
            elevation: 0,
            borderOnForeground: false,
            color: Colors.white,
            shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Product Image
                  Expanded(
                    child: Hero(
                      tag: widget.item.image,
                      child: Container(
                        key: imageGk,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            widget.item.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Product Name
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text(
                      widget.item.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),

                  // Product Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        utilsServices.priceToCurrency(widget.item.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // Add to cart button
        Positioned(
          bottom: 48,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Material(
              child: InkWell(
                onTap: () {
                  switchAddIcon();
                  widget.cartAnimationMethod(imageGk);
                },
                child: Ink(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: CustomColors.customSwatchColor,
                  ),
                  child: Icon(
                    addIcon,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Favorite button
        Positioned(
          top: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Material(
              child: InkWell(
                onTap: () {
                  switchFavIcon();
                  utilsServices.showToast(
                      message: 'Produto adicionado aos Favoritos');
                },
                child: Ink(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: CustomColors.customSwatchColor,
                  ),
                  child: Icon(
                    favIcon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
