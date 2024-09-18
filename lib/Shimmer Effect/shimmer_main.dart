import 'package:animation_work/Shimmer%20Effect/shimmer_widget.dart';
import 'package:flutter/material.dart';

import 'food.dart';
import 'foods.dart';

class LoaingShimmer extends StatelessWidget {
  static const String title = 'Shimmer Effect Loading';

  const LoaingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.blue.shade200,
        primarySwatch: Colors.deepOrange
      ),
      home: const loadingEffect(title: title),
    );
  }
}

class loadingEffect extends StatefulWidget {
  final String title;

  const loadingEffect({Key? key, required this.title}) : super(key: key);

  @override
  State<loadingEffect> createState() => _loadingEffectState();
}

class _loadingEffectState extends State<loadingEffect> {
  List<Food> foods = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future loadData() async {
    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 2), () {});
    foods = List.of(allFoods);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: loadData
          )
        ],
      ),
      body: ListView.builder(
        itemCount: isLoading ? 3 : foods.length,
        itemBuilder: (context, index) {
          if(isLoading) {
            return buildShimmer();
          } else {
            final food = foods[index];

            return buildFood(food);
          }
        }
      ),
    );
  }

  Widget buildFood(Food food) => ListTile(
    leading: CircleAvatar(
      radius: 32,
      backgroundImage: NetworkImage(food.urlImage),
    ),
    title: Text(
      food.title,
      style: const TextStyle(fontSize: 16),
    ),
    subtitle: Text(
      food.description,
      style: const TextStyle(fontSize: 14),
      maxLines: 1,
    ),
  );
  
  Widget buildShimmer() => ListTile(
    leading: const ShimmerWidget.circular(
      width: 64,
      height: 64,
      // shapeBorder: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(12)
      // ),
    ),
    title: Align(
      alignment: Alignment.centerLeft,
      child: ShimmerWidget.rectangular(
        width: MediaQuery.of(context).size.width *0.3,
        height: 16
      ),
    ),
    subtitle: const ShimmerWidget.rectangular(height: 14),
  );
}