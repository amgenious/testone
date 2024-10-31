import 'package:community_app/pages/discover_page.dart';
import 'package:community_app/pages/membersearch_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    );
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
   int currentPage = 0;
  List<Widget> pages = const [
   DicoverPage(),
   SearchPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.amber,
        indicatorColor: Colors.white,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Discover'),
          NavigationDestination(icon: Icon(Icons.people), label: 'Members'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
