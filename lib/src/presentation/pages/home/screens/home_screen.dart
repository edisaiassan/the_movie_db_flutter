import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/src/presentation/pages/home/controller/home_controller.dart';
import 'package:the_movie_db/src/presentation/pages/home/screens/widgets/trending_list.dart';
import 'package:the_movie_db/src/presentation/pages/home/screens/widgets/trending_performers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeController>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<HomeController>().init();
        },
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          children: const [
            TrendingList(),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: TrendingPerformers(),
            ),
          ],
        ),
      ),
    );
  }
}
