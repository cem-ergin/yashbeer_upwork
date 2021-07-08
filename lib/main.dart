import 'package:flutter/material.dart';
import 'package:yashbeer/utils/locator.dart';

import 'pages/home/home_page.dart';
import 'utils/size_helper.dart';

void main() {
  MyLocator.setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'abcdapp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SizeHelper _sizeHelper = locator<SizeHelper>();
  @override
  Widget build(BuildContext context) {
    _sizeHelper.context = context;
    _sizeHelper.size = MediaQuery.of(context).size;

    return HomePage();
  }
}
