import 'package:flutter/material.dart';
import '../home/home_tab.dart';
import '../orders/orders_tab.dart';
import '../profile/profile_tab.dart';
import '/src/config/custom_colors.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            const HomeTab(),
            Container(
              color: Colors.green,
            ),
            const ProfileTab(),
            const OrdersTab(),
          ]),

      // Navigation Bottom Menu
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate);
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: CustomColors.customSwatchColor,
        unselectedItemColor: CustomColors.customSwatchColor.withAlpha(100),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Carteira',
          ),
        ],
      ),
    );
  }
}
