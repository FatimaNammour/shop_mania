import 'package:flutter/material.dart';
import 'package:shop_mania/core/theme.dart';
import 'package:shop_mania/presentation/home/category_page.dart';
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
    CategoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/craig-mckay-jmURdhtm7Ng-unsplash.jpg"),
                      fit: BoxFit.fitWidth),
                  shape: BoxShape.circle,
                  color: ConstColors.fieldFilled),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi, Jonathan",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  "let's go shopping",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/SearchScreen',
                );
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40.0,
            child: TabBar(
              controller: TabController(length: 2, vsync: this),
              tabs: const [Text("Home"), Text("Category")],
              onTap: onTapTapped,
            ),
          ),
          Expanded(child: homePages.elementAt(selectedIndex)),
        ],
      ),
    );
  }
}
