import 'package:flutter/material.dart';
import 'package:painter/painter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Painter Example',
      home: Rangulu(),
    );
  }
}

class Rangulu extends StatefulWidget {
  const Rangulu({Key? key}) : super(key: key);

  @override
  _RanguluState createState() => _RanguluState();
}

class _RanguluState extends State<Rangulu> {
  List<Container> stackList = [];
  PainterController _controller = newController();

  static PainterController newController() {
    PainterController controller = PainterController();
    controller.thickness = 5.0;
    controller.backgroundColor = Colors.green;
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 720 / MediaQuery.of(context).devicePixelRatio,
            width: 720 / MediaQuery.of(context).devicePixelRatio,
            child: Stack(
              children: [
                    Container(
                      child: Painter(_controller),
                    )
                  ] +
                  stackList,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton(
                  child: const Icon(Icons.clear), onPressed: _controller.clear),
              FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    addStackele();
                  }),
            ],
          ),
        ],
      ),
    );
  }

  void addStackele() {
    setState(() {
      stackList.add(stackEle());
    });
  }

  Container stackEle() {
    _controller = newController();
    return Container(
      child: Painter(_controller),
    );
  }
}
