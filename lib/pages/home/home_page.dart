import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:yashbeer/constants/constants.dart';
import 'package:yashbeer/utils/locator.dart';
import 'package:yashbeer/utils/size_helper.dart';

import '../bar_page.dart';

SizeHelper _sizeHelper = locator<SizeHelper>();

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _switchValue = true;
  int _itemIndex = 0;
  int _headerIndex = 0;
  @override
  void initState() {
    super.initState();
    _switchValue = true;
    _itemIndex = 0;
    _headerIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/1. Background.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Stack(
              children: [
                _buildABCDSection(),
                _buildAppBarShadow(),
                _buildAppBar(),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  _sizeHelper.sbh(24),
                  _buildItems(),
                  _sizeHelper.sbh(48),
                  _buildHeaderSelectionView(),
                  _sizeHelper.sbh(56),
                  _buildPrizeView("Rs. 50", "Rs. 20", "0"),
                  _buildPrizeView("Rs. 150", "Rs. 30", "0"),
                  _buildPrizeView("Rs. 350", "Rs. 45", "0"),
                  _buildPrizeView("Rs. 550", "Rs. 75", "0"),
                  _buildPrizeView("Rs. 650", "Rs. 100", "0"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildAppBarShadow() {
    return Padding(
      padding: EdgeInsets.only(
        top: _sizeHelper.getHeight(72.0),
      ),
      child: ClipPath(
        clipper: OvalBottomBorderClipper(),
        child: Container(
          height: _sizeHelper.getHeight(60),
          width: _sizeHelper.size.width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              new BoxShadow(
                spreadRadius: 1,
                blurRadius: 100.0,
                offset: Offset(0, _sizeHelper.getHeight(40)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildPrizeView(
      String prizeString, String entryString, String lifeLinesString) {
    return Row(
      children: [
        _sizeHelper.sbw(30),
        Container(
          height: _sizeHelper.getHeight(100),
          width: _sizeHelper.size.width - _sizeHelper.getWidth(60),
          decoration: BoxDecoration(
            // color: Colors.red,
            image: DecorationImage(
              image: AssetImage("assets/images/Group 3.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    _sizeHelper.sbw(32),
                    Text(
                      "Prize:",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 79, 171, 1),
                        fontWeight: FontWeight.bold,
                        letterSpacing: -2,
                        fontSize: _sizeHelper.getWidth(17),
                      ),
                    ),
                    Text(
                      " $prizeString",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 79, 171, 1),
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0,
                        fontSize: _sizeHelper.getWidth(24),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: _sizeHelper.getHeight(24),
                      right: _sizeHelper.getWidth(28),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Entry: ",
                          style: TextStyle(
                            color: Color.fromRGBO(246, 209, 75, 1),
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0,
                            fontSize: _sizeHelper.getWidth(13),
                          ),
                        ),
                        Text(
                          "$entryString",
                          style: TextStyle(
                            color: Color.fromRGBO(246, 209, 75, 1),
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1,
                            fontSize: _sizeHelper.getWidth(18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: _sizeHelper.getHeight(8),
                      right: _sizeHelper.getWidth(28),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Life lines: $lifeLinesString",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0,
                            fontSize: _sizeHelper.getWidth(13),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        _sizeHelper.sbw(30),
      ],
    );
  }

  Row _buildHeaderSelectionView() {
    return Row(
      children: [
        _sizeHelper.sbw(20),
        Expanded(
          child: Container(
            height: _sizeHelper.getHeight(80),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(112, 206, 249, 1),
                width: _sizeHelper.getWidth(5),
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                _sizeHelper.getWidth(44),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.0,
                  offset: Offset(0.0, 0.75),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _headerIndex = 0;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            _sizeHelper.getWidth(44),
                          ),
                          bottomLeft: Radius.circular(
                            _sizeHelper.getWidth(44),
                          ),
                        ),
                        color: _headerIndex == 0
                            ? Color.fromRGBO(205, 62, 64, 1)
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "SOLO",
                          style: _headerIndex == 0
                              ? _selectedHeaderTextStyle()
                              : _unSelectedHeaderTextStyle(),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _headerIndex = 1;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: _headerIndex == 1
                            ? Color.fromRGBO(205, 62, 64, 1)
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "VERSES",
                          style: _headerIndex == 1
                              ? _selectedHeaderTextStyle()
                              : _unSelectedHeaderTextStyle(),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _headerIndex = 2;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                            _sizeHelper.getWidth(44),
                          ),
                          bottomRight: Radius.circular(
                            _sizeHelper.getWidth(44),
                          ),
                        ),
                        color: _headerIndex == 2
                            ? Color.fromRGBO(205, 62, 64, 1)
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "TABLE",
                          style: _headerIndex == 2
                              ? _selectedHeaderTextStyle()
                              : _unSelectedHeaderTextStyle(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _sizeHelper.sbw(20),
      ],
    );
  }

  TextStyle _selectedHeaderTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: _sizeHelper.getWidth(24),
      fontWeight: FontWeight.w900,
      letterSpacing: -1,
    );
  }

  TextStyle _unSelectedHeaderTextStyle() {
    return TextStyle(
      color: Color.fromRGBO(194, 194, 194, 1),
      fontSize: _sizeHelper.getWidth(20),
      fontWeight: FontWeight.w900,
      letterSpacing: -1,
    );
  }

  Container _buildItems() {
    return Container(
      height: _sizeHelper.getHeight(150),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: MyConstants.itemNames.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(index);
        },
      ),
    );
  }

  Padding _buildItem(int index) {
    return Padding(
      padding: EdgeInsets.only(
        left: _sizeHelper.getWidth(19),
      ),
      child: InkWell(
        onTap: () {
          _itemIndex = index;
          setState(() {});
        },
        child: Container(
          height: _sizeHelper.getHeight(150),
          width: _sizeHelper.getWidth(90),
          decoration: BoxDecoration(
            color: _itemIndex == index
                ? Color.fromRGBO(226, 226, 226, 1)
                : Colors.white,
            borderRadius: BorderRadius.circular(
              _sizeHelper.getWidth(26),
            ),
            // boxShadow: [
            //   BoxShadow(
            //     blurRadius: 1.0,
            //   ),
            // ],
          ),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  "${MyConstants.itemAssets[index]}",
                  width: _sizeHelper.getWidth(50),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: _itemIndex == index
                      ? Color.fromRGBO(246, 199, 79, 1)
                      : Color.fromRGBO(47, 59, 141, 1),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(
                      _sizeHelper.getWidth(26),
                    ),
                    bottomLeft: Radius.circular(
                      _sizeHelper.getWidth(26),
                    ),
                  ),
                ),
                height: _sizeHelper.getHeight(40),
                child: Center(
                  child: Text(
                    "${MyConstants.itemNames[index]}",
                    style: _itemIndex == index
                        ? TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: _sizeHelper.getWidth(14),
                            letterSpacing: -1,
                          )
                        : TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: _sizeHelper.getWidth(14),
                            letterSpacing: -1,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildABCDSection() {
    return Padding(
      padding: EdgeInsets.only(
        top: _sizeHelper.getHeight(88.0),
      ),
      child: Container(
        height: _sizeHelper.getHeight(150),
        width: _sizeHelper.size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: _radiusAppBar(),
            bottomLeft: _radiusAppBar(),
          ),
          boxShadow: [
            new BoxShadow(
              blurRadius: 40.0,
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: _sizeHelper.getHeight(28.0),
            ),
            child: Row(
              children: [
                _sizeHelper.sbw(46),
                ClipOval(
                  child: Container(
                    color: Color.fromRGBO(180, 180, 180, 1),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Image.asset(
                      "assets/images/1-01.png",
                      height: _sizeHelper.getHeight(75),
                      width: _sizeHelper.getWidth(150),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                ClipOval(
                  child: Container(
                    color: Color.fromRGBO(180, 180, 180, 1),
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ),
                ),
                _sizeHelper.sbw(46),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ClipPath _buildAppBar() {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        padding: EdgeInsets.only(
          bottom: _sizeHelper.getHeight(8),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 5,
              blurRadius: 7,
            ),
          ],
        ),
        child: ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => BarPage()));
            },
            child: Container(
              height: _sizeHelper.getHeight(120),
              width: _sizeHelper.size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                  ),
                ],
                color: Color.fromRGBO(7, 21, 102, 1),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: _sizeHelper.getHeight(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _sizeHelper.sbw(16),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                _sizeHelper.getWidth(12),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                _sizeHelper.getWidth(6),
                              ),
                              child: Icon(
                                Icons.menu,
                                color: Color.fromRGBO(17, 82, 173, 1),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: _sizeHelper.getWidth(20),
                            backgroundColor: Color.fromRGBO(49, 96, 171, 1),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/man3.jpeg"),
                              radius: _sizeHelper.getWidth(18),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "John Doe",
                                style: _whiteExtraBold().copyWith(
                                  letterSpacing: -0.5,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: _sizeHelper.getWidth(22),
                                    color: Color.fromRGBO(43, 105, 202, 1),
                                  ),
                                  Stack(
                                    children: <Widget>[
                                      Text(
                                        '10',
                                        style: TextStyle(
                                          fontSize: _sizeHelper.getWidth(22),
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 1
                                            ..color = Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '10',
                                        style: TextStyle(
                                          fontSize: _sizeHelper.getWidth(22),
                                          color:
                                              Color.fromRGBO(43, 105, 202, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Cash Mode",
                            style: _whiteExtraBold().copyWith(
                              color: !_switchValue ? Colors.grey : Colors.white,
                            ),
                          ),
                          _sizeHelper.sbh(8),
                          Transform.scale(
                            scale: 0.6,
                            child: Transform.rotate(
                              angle: pi * 1.5,
                              child: FlutterSwitch(
                                activeColor: Colors.white,
                                inactiveColor: Colors.white,
                                activeToggleColor:
                                    Color.fromRGBO(43, 105, 202, 1),
                                inactiveToggleColor:
                                    Color.fromRGBO(43, 105, 202, 1),
                                onToggle: (value) {
                                  _switchValue = value;
                                  setState(() {});
                                },
                                value: _switchValue,
                              ),
                              // child: CupertinoSwitch(
                              //   activeColor: Colors.white,
                              //   trackColor: Colors.white,
                              //   onChanged: (value) {
                              //     _switchValue = value;
                              //     setState(() {});
                              //   },
                              //   value: _switchValue,
                              // ),
                            ),
                          ),
                          _sizeHelper.sbh(8),
                          Text(
                            "Free Mode",
                            style: _whiteExtraBold().copyWith(
                              color: _switchValue ? Colors.grey : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: _sizeHelper.getHeight(50),
                        width: _sizeHelper.getWidth(30),
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage("assets/images/Group 204.png"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        child: Row(
                          children: [
                            _sizeHelper.sbw(12),
                            Text(
                              "Rs.",
                              style: TextStyle(
                                color: Color.fromRGBO(0, 79, 171, 1),
                                fontWeight: FontWeight.bold,
                                letterSpacing: -2,
                                fontSize: _sizeHelper.getWidth(10),
                              ),
                            ),
                            Text(
                              " 2456",
                              style: TextStyle(
                                color: Color.fromRGBO(0, 79, 171, 1),
                                fontWeight: FontWeight.bold,
                                letterSpacing: -2,
                                fontSize: _sizeHelper.getWidth(14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _whiteExtraBold() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w900,
      fontSize: _sizeHelper.getWidth(11),
    );
  }

  Radius _radiusAppBar() => Radius.elliptical(100, 80);
}
