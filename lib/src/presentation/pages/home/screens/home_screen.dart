import 'package:flutter/material.dart';
import 'package:the_movie_db/src/presentation/pages/home/screens/widgets/trending_list.dart';
import 'package:the_movie_db/src/presentation/pages/home/screens/widgets/trending_performers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _counter++;
          });
        },
        child: ListView(
          key: ValueKey(_counter),
          padding: const EdgeInsets.all(16.0),
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          children: const [
            TrendingList(),
            Padding(
              padding: EdgeInsets.only(top:16.0),
              child: TrendingPerformers(),
            ),
          ],
        ),
      ),
    );
  }
}
