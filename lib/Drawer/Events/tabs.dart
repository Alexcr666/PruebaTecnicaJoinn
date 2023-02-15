import 'package:flutter/material.dart';

import 'package:container_tab_indicator/container_tab_indicator.dart';

class AppTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('ContainerTabIndicator Example'),
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 56,
                child: TabBar(
                  tabs: [
                    Text('First', style: TextStyle(color: Colors.black)),
                    Text('Second', style: TextStyle(color: Colors.black)),
                  ],
                  indicator: ContainerTabIndicator(
                    widthFraction: 0.6,
                    height: 4,
                    padding: const EdgeInsets.only(top: 26),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
                child: TabBarView(
                  children: [
                    Container(color: Colors.red[400]),
                    Container(color: Colors.green[400]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
