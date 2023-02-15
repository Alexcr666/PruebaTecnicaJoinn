import 'package:dj_mania/Drawer/wallet/components/appbar.dart';
import 'package:dj_mania/Drawer/wallet/components/cards.dart';
import 'package:dj_mania/Drawer/wallet/components/recentTransactions.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors().backgroundColor,
        child: Column(
          children: [
            //Appbar(),
            CardsList(),
            RecentTransactions(),
          ],
        ),
      ),
    );
  }
}
