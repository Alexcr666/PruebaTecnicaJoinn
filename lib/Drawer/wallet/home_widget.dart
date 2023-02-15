//import 'package:banking_app/screens/home.dart';
import 'package:dj_mania/Drawer/wallet/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

// Used for Bottom Navigation Bar

class _HomeWidgetState extends State<HomeWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      WalletScreen(),
      WalletScreen(),
      WalletScreen(),
      WalletScreen(),
    ];
    void onTabTapped(index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: widgetOptions.elementAt(selectedIndex),
      /*  bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        onTap: onTabTapped,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/home-icon.svg'),
            label: 'Home',
            // title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/transactions-icon.svg'),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/settings-icon.svg'),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/smiley-icon.svg'),
            label: 'Account',
          ),
        ],
      ),*/
    );
  }
}
