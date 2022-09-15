import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:badges/badges.dart';

import 'package:flutter/material.dart';

import '../../components/category_tile.dart';
import '../../components/item_tile.dart';
import '../../config/custom_colors.dart';
import '../../config/app_data.dart' as app_data;
import '../cart/cart_tab.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Burgers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text.rich(
          TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            children: [
              TextSpan(text: 'he'),
              TextSpan(text: '.'),
              TextSpan(text: 'st'),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (c) {
                    return CartTab();
                  }),
                );
              },
              child: Badge(
                badgeColor: CustomColors.customSwatchColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          //Store Headline
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 20,
              right: 150,
            ),
            child: SizedBox(
              height: 100,
              child: DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                child: AnimatedTextKit(
                  repeatForever: false,
                  animatedTexts: [
                    TyperAnimatedText('Você tem fome de que?'),
                  ],
                ),
              ),
            ),
          ),

          //SearchIcon
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Pesquise aqui...',
                hintStyle: TextStyle(
                  color: CustomColors.customSwatchColor.shade400,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customSwatchColor.shade400,
                  size: 18,
                ),
                suffixIcon: Icon(Icons.mic,
                    color: CustomColors.customSwatchColor.shade400),
                filled: true,
                fillColor: Colors.grey.shade50,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),

          //Categories
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTile(
                    onPressed: () {
                      setState(() {
                        selectedCategory = app_data.categories[index];
                      });
                    },
                    category: app_data.categories[index],
                    isSelected: app_data.categories[index] == selectedCategory,
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(width: 20),
                itemCount: app_data.categories.length,
              ),
            ),
          ),

          //Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.3,
              ),
              itemCount: app_data.items.length,
              itemBuilder: (_, index) {
                return ItemTile(
                  item: app_data.items[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
