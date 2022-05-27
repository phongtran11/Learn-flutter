import 'package:app/json/root_app_json.dart';
import 'package:app/screens/screens.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  // Home Body
  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: const [
        HomeScreen(),
      ],
    );
  }

  // Bottom Navigation
  Widget getBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.09)),
      height: 60,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = index;
                });
              },
              child: Column(children: [
                Icon(
                    activeTab == index
                        ? items[index]['iconActive']
                        : items[index]['icon'],
                    color: Colors.white),
                const SizedBox(height: 5),
                Text(
                  items[0]['title'],
                  style: TextStyle(
                      color: activeTab == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                      fontSize: 10),
                )
              ]),
            );
          }),
        ),
      ),
    );
  }
}
