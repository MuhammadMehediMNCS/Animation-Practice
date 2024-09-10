import 'package:flutter/material.dart';

class CardItem {
  final String title;
  final String urlImage;
  final Color color;
  final bool isTapped;

  const CardItem({
    required this.title,
    required this.urlImage,
    required this.color,
    this.isTapped = false
  });

  CardItem copy({
    String? title,
    String? urlImage,
    Color? color,
    bool? isTapped
  }) => CardItem(
    title: title ?? this.title,
    urlImage: urlImage ?? this.urlImage,
    color: color ?? this.color,
    isTapped: isTapped ?? this.isTapped
  );
}


class AniOpacity extends StatelessWidget {
  static const String title = 'Opacity Example';

  const AniOpacity({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: const OpacityAnimatio(title: title),
    );
  }
}

class OpacityAnimatio extends StatefulWidget {
  final String title;

  const OpacityAnimatio({Key? key, required this.title}) : super(key: key);

  @override
  State<OpacityAnimatio> createState() => _OpacityAnimatioState();
}

class _OpacityAnimatioState extends State<OpacityAnimatio> {
  List<CardItem> items = <CardItem>[
    CardItem(
      title: 'Painting',
      urlImage: 'https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=333&q=80',
      color: Colors.orange.shade300
    ),
    CardItem(
      title: 'Painting',
      urlImage: 'https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=333&q=80',
      color: Colors.blue.shade200
    ),
    CardItem(
      title: 'Painting',
      urlImage: 'https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=333&q=80',
      color: Colors.deepPurple.shade200
    ),
    CardItem(
      title: 'Painting',
      urlImage: 'https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=333&q=80',
      color: Colors.green.shade400
    ),
    CardItem(
      title: 'Painting',
      urlImage: 'https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=333&q=80',
      color: Colors.red.shade200
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const double padding = 8;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: padding,
          mainAxisSpacing: padding,
          childAspectRatio: 3 / 4
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return buildCard(item: item);
        }
      ),
    );
  }

  Widget buildCard({required CardItem item}) => GestureDetector(
    onTapDown: (_) => setTapped(item, isTapped: true),
    onTapUp: (_) => setTapped(item, isTapped: false),
    onTapCancel: () => setTapped(item, isTapped: false),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: item.color,
            child: AnimatedOpacity(       // We can use only 'Opacity'.
              opacity: item.isTapped ? 1 : 0.5,
              duration: const Duration(milliseconds: 200),
              child: Image.network(
                item.urlImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if(!item.isTapped)
          Center(
            child: Text(
              item.title,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          )
        ],
      ),
    ),
  );

  void setTapped(CardItem item, {required bool isTapped}) {
    setState(() {
      items = items.map((otherItem) => item == otherItem ? item.copy(isTapped: isTapped) : otherItem).toList();
    });
  }
}


class AO extends StatefulWidget {
  final String title;

  const AO({Key? key, required this.title}) : super(key: key);

  @override
  State<AO> createState() => _AOState();
}

class _AOState extends State<AO> {
  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 2),
              child: buildContainer()
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => setState(() => opacityLevel == 0 ? 1.0 : 0.0),
              child: const Text('Fade Logo')
            )
          ],
        ),
      ),
    );
  }

Widget buildContainer() => Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.deepOrange.shade300, width: 2),
    borderRadius: BorderRadius.circular(12)
  ),
  height: 120,
  width: 120,
  child: const FlutterLogo(),
);
}