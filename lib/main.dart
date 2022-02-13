import 'package:flutter/material.dart';

//import 'package:painter/painter.dart';
import 'muggu.dart';

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
  PainterController controller = newController();

  static PainterController newController() {
    PainterController controller = PainterController();
    controller.thickness = 5.0;
    controller.backgroundColor = Colors.green;
    controller.drawColor = Colors.red;
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
                      child: Muggu(controller),
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
                  child: const Icon(Icons.clear), onPressed: controller.clear),
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
    controller = newController();
    return Container(
      child: Muggu(controller),
    );
  }
}

class LowIntesPaint extends CustomPainter {
  PainterController pc;

  LowIntesPaint(this.pc);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(Offset.zero & size, Paint());
    for (MapEntry<Path, Paint> path in pc.pathHistory.paths) {
      Paint p = path.value;
      canvas.drawPath(path.key, p);
    }
    canvas.drawRect(new Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        pc.pathHistory.paths.first.value);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
