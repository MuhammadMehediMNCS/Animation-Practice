import 'package:flutter/material.dart';
import 'widget_calendar_door.dart';

class AdventDoorMain extends StatelessWidget {
  final String appTitle = 'AdventDoor';

  const AdventDoorMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primaryColor: Colors.red,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 64.0)
        )
      ),
      home: DoorPage(appTitle: appTitle),
    );
  }
}

class DoorPage extends StatefulWidget {
  final String appTitle;

  const DoorPage({Key? key, required this.appTitle}) : super(key: key);

  @override
  State<DoorPage> createState() => _DoorPageState();
}

class _DoorPageState extends State<DoorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
      ),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: CalendarDoorWidget(
            outerDoor: buildOuterDoor(context, number: 8),
            innerDoor: buildInnerDoor(context),
            child: Image.asset(
              'Assets/advent9.png',
              fit: BoxFit.fill,
            ),
          )
        ),
      ),
    );
  }

  Widget buildOuterDoor(BuildContext context, {int? number}) => Container(
    color: Colors.red,
    child: Center(
      child: Text(
        '$number',
        style: const TextStyle(fontSize: 64, color: Colors.white)
        //Theme.of(context).textTheme.headline1,
      ),
    ),
  );

  Widget buildInnerDoor(BuildContext context) => Container(
    color: Colors.green[700],
  );
}