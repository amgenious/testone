import 'package:community_app/views/feed_view.dart';
import 'package:flutter/material.dart';

class DicoverPage extends StatefulWidget {
  const DicoverPage({super.key});

  @override
  State<DicoverPage> createState() => _DicoverPageState();
}

class _DicoverPageState extends State<DicoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feeds"),
      ),
      body: const FeedsView(),
    );
  }
}