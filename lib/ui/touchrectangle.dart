import 'package:flutter/material.dart';

class WriteScreen extends StatefulWidget {
 @override
  _WriteScreenState createState() => new _WriteScreenState();
}

class KanjiPainter extends ChangeNotifier implements CustomPainter {
  Color strokeColor;
  var strokes = new List<List<Offset>>();

  KanjiPainter(this.strokeColor);

  bool hitTest(Offset position) => null;

  void startStroke(Offset position) {
    print("startStroke");
    strokes.add([position]);
    notifyListeners();
  }

  void appendStroke(Offset position) {
    print("appendStroke");
    var stroke = strokes.last;
    stroke.add(position);
    notifyListeners();
  }

  void endStroke() {
    notifyListeners();
  }

  @override
  void paint(Canvas canvas, Size size) {
    print("paint!");
    var rect = Offset.zero & size;
    Paint fillPaint = new Paint();
    fillPaint.color = Colors.yellow[100];
    fillPaint.style = PaintingStyle.fill;
    canvas.drawRect(rect, fillPaint);

    Paint strokePaint = new Paint();
    strokePaint.color = Colors.black;
    strokePaint.style = PaintingStyle.stroke;

    for (var stroke in strokes) {
      Path strokePath = new Path();
      // Iterator strokeIt = stroke.iterator..moveNext();
      // Offset start = strokeIt.current;
      // strokePath.moveTo(start.dx, start.dy);
      // while (strokeIt.moveNext()) {
      //   Offset off = strokeIt.current;
      //   strokePath.addP
      // }
      strokePath.addPolygon(stroke, false);
      canvas.drawPath(strokePath, strokePaint);
    }
  }

  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  // TODO: implement semanticsBuilder
  get semanticsBuilder => null;

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) {
    // TODO: implement shouldRebuildSemantics
    return null;
  }
}

class _WriteScreenState extends State<WriteScreen> {
  GestureDetector touch;
  CustomPaint canvas;
  KanjiPainter kanjiPainter;

  void panStart(DragStartDetails details) {
    print(details.globalPosition);
    kanjiPainter.startStroke(details.globalPosition);
  }

  void panUpdate(DragUpdateDetails details) {
    print(details.globalPosition);
    kanjiPainter.appendStroke(details.globalPosition);
  }

  void panEnd(DragEndDetails details) {
    kanjiPainter.endStroke();
  }

  @override
  void initState() {
    super.initState();
    kanjiPainter = new KanjiPainter(const Color.fromRGBO(255, 255, 255, 1.0));
  }

  @override
  Widget build(BuildContext context) {
    touch = new GestureDetector(
      onPanStart: panStart,
      onPanUpdate: panUpdate,
      onPanEnd: panEnd,
    );

    canvas = new CustomPaint(
      painter: kanjiPainter,
      child: touch,
      // child: new Text("Custom Painter"),
      // size: const Size.square(100.0),
    );

    Container container = new Container(
        padding: new EdgeInsets.all(20.0),
        child: new ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: new Card(
              elevation: 10.0,
              child: canvas,
            )));

    return new Scaffold(
      appBar: new AppBar(title: new Text("Draw!")),
      backgroundColor: const Color.fromRGBO(200, 200, 200, 1.0),
      body: container,
    );
  }
}