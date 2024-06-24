import 'package:flutter/material.dart';
import 'package:shop_mania/presentation/home/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int selectedIndex = 0;

  void onTapTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static const List<Widget> homePages = <Widget>[
    HomePage(),
    Text('hhhhhh Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.0,
          child: TabBar(
            controller: TabController(length: 2, vsync: this),
            tabs: const [Text("Home"), Text("Category")],
            onTap: onTapTapped,
          ),
        ),
        homePages.elementAt(selectedIndex),
      ],
    );
  }
}
