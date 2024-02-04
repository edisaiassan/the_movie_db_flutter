import 'package:flutter/material.dart';
import 'package:the_movie_db/src/presentation/pages/home/screens/widgets/trending_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        children: const [
          TrendingList(),
        ],
      ),
    );
  }
}
