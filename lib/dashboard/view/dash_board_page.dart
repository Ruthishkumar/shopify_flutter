import 'package:flutter/material.dart';
import 'package:shopify_flutter/dashboard/sections/cart_page.dart';
import 'package:shopify_flutter/dashboard/sections/home_page.dart';
import 'package:shopify_flutter/dashboard/sections/orders_page.dart';
import 'package:shopify_flutter/dashboard/sections/profile_page.dart';
import 'package:shopify_flutter/widget/styles/app_colors.dart';

class DashBoardPage extends StatefulWidget {
  static const routeName = '/dashboardPage';

  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int selectIndex = 0;

  Widget getBody(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const OrdersPage();
      case 2:
        return const CartPage();
      case 3:
        return const ProfilePage();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          elevation: 1,
          unselectedItemColor: Colors.grey.withOpacity(0.7),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: (''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: (''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: (''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: (''),
            ),
          ],
          onTap: (int index) {
            setState(() {
              selectIndex = index;
            });
          }),
      body: getBody(selectIndex),
    );
  }
}
