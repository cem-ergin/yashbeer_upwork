import 'package:flutter/material.dart';

class BarPage extends StatefulWidget {
  BarPage({Key? key}) : super(key: key);

  @override
  _BarPageState createState() => _BarPageState();
}

class _BarPageState extends State<BarPage> {
  final _containerHeight = 300.0;
  final _containerWidth = 200.0;

  final _columnBlockLength = 15;
  final _rowBlockLength = 8;

  List<Positioned> myBars = [];

  @override
  void initState() {
    super.initState();
    myBars = _buildBlocks(100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: InkWell(
          onTap: () async {
            // getDecimalPoints(2);
            setState(() {
              myBars.clear();
            });
            await Future.delayed(Duration(milliseconds: 25));
            setState(() {
              myBars = _buildBlocks(50);
            });
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: _containerHeight,
                    width: _containerWidth,
                    color: Colors.red,
                  ),
                  // ..._buildBlocks(50),
                  ...myBars,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Positioned> _buildBlocks(double percentage) {
    final List<Positioned> _myWidgets = [];
    final _blockLength =
        (_columnBlockLength * _rowBlockLength / 100) * percentage;
    print("block length: $_blockLength");
    print("block length int: ${_blockLength.toInt()}");

    for (var i = 0; i < _blockLength; i++) {
      if (i == _blockLength.toInt()) {
        _myWidgets.add(
          Positioned(
            bottom: _containerHeight /
                _columnBlockLength *
                (i / _rowBlockLength).floor(),
            right: _containerWidth / _rowBlockLength * (i % _rowBlockLength),
            child: AnimatedBarView(
              index: i,
              child: Container(
                height: getDecimalPoints(_blockLength) *
                    (_containerHeight / _columnBlockLength - 1) /
                    100,
                width: _containerWidth / _rowBlockLength - 1,
                color: Colors.blue,
              ),
            ),
          ),
        );
      } else {
        _myWidgets.add(
          Positioned(
            bottom: _containerHeight /
                _columnBlockLength *
                (i / _rowBlockLength).floor(),
            right: _containerWidth / _rowBlockLength * (i % _rowBlockLength),
            child: AnimatedBarView(
              index: i,
              child: Container(
                key: UniqueKey(),
                height: _containerHeight / _columnBlockLength - 1,
                width: _containerWidth / _rowBlockLength - 1,
                color: Colors.blue,
              ),
            ),
          ),
        );
      }
    }
    return _myWidgets;
  }

  double getDecimalPoints(double point) {
    final _stringPoint = point.toString();
    // print("stringPoint: $_stringPoint");
    final _pointsList = _stringPoint.split(".");
    if (_pointsList.length == 1 || _pointsList.length == 0) {
      return 0;
    }
    final _decimalPoint = _pointsList.last;
    // print("decimalPoint: $_decimalPoint");
    final _decimalFirstTwoPoint = _decimalPoint.length >= 2
        ? _decimalPoint.substring(0, 2)
        : "$_decimalPoint" + "0";
    // print("decimalPoint: $_decimalFirstTwoPoint");

    return double.parse(_decimalFirstTwoPoint);
  }
}

class AnimatedBarView extends StatefulWidget {
  final int? index;
  final Widget? child;
  AnimatedBarView({Key? key, @required this.index, @required this.child})
      : super(key: key);

  @override
  _AnimatedBarViewState createState() => _AnimatedBarViewState();
}

class _AnimatedBarViewState extends State<AnimatedBarView> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    print("init state?");
    Future.delayed(Duration(milliseconds: widget.index! * 250), () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 1000),
      opacity: _animate ? 1 : 0,
      curve: Curves.easeInOutQuart,
      child: widget.child!,
    );
  }
}
