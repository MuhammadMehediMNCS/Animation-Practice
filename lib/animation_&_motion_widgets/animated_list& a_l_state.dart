import 'package:flutter/material.dart';

class ListAnimation extends StatelessWidget {
  static const String title = 'AnimatedList & AnimatedListState';

  const ListAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black54
      ),
      home: AnimationList(title: title),
    );
  }
}

class AnimationList extends StatefulWidget {
  final String title;

  const AnimationList({Key? key, required this.title}) : super(key: key);

  @override
  State<AnimationList> createState() => _AnimationListState();
}

class _AnimationListState extends State<AnimationList> {
  final listKey = GlobalKey<AnimatedListState>();
  final List<ListItem> items = List.from(listItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) => ListItemWidget(
          item: items [index],
          animation: animation,
          onClicked: () => removeItem(index)
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: inserItem,
        child: const Icon(Icons.add)
      ),
    );
  }

  void inserItem() {
    const newIndex = 1;
    const newItem = ListItem(
      title: 'Apple',
      urlImage: 'urlImage'
    );
    //final newItem = (List.of(listItems)..shuffle()).first;

    items.insert(newIndex, newItem);
    listKey.currentState!.insertItem(
      newIndex,
      duration: const Duration(milliseconds: 600)
    );
  }

  void removeItem(int index) {
    final removedItem = items[index];

    items.removeAt(index);
    listKey.currentState!.removeItem(index, (context, animation) => ListItemWidget(
      item: removedItem,
      animation: animation,
      onClicked: () {}
    ),
    duration: const Duration(milliseconds: 600)
    );
  }
}


class ListItem {
  final String title;
  final String urlImage;

  const ListItem({
    required this.title,
    required this.urlImage
  });
}


final List<ListItem> listItems = [
  const ListItem(
    title: 'Milk',
    urlImage: 'urlImage'
  ),
  const ListItem(
    title: 'Bread',
    urlImage: 'urlImage'
  ),
  const ListItem(
    title: 'Banana',
    urlImage: 'urlImage'
  ),
];


class ListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  const ListItemWidget({
    Key? key,
    required this.item,
    required this.animation,
    required this.onClicked
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizeTransition(
    key: ValueKey(item.urlImage),
    sizeFactor: animation,
    child: buildItem()
  );
  /*SlideTransition(
    position: Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset.zero
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn)),
    child: buildItem()
  );*/

  Widget buildItem() => Container(
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white
    ),
    child: ListTile(
      contentPadding: const EdgeInsets.all(16),
      leading: const CircleAvatar(
        radius: 32,
        backgroundImage: NetworkImage('url'),
      ),
      title: Text(
        item.title,
        style: const TextStyle(fontSize: 20, color: Colors.black),
      ),
      trailing: IconButton(
        onPressed: onClicked,
        icon: Icon(Icons.delete, size: 32, color: Colors.purple[200],)
        ),
    ),
  );
}