//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../widgets/NavDrawerWidget.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).primaryColor);    
    return MaterialApp(
//==========================================================================
// SHOW DEBUG
//==========================================================================      
      debugShowCheckedModeBanner: false,         
//==========================================================================
// THEME
//==========================================================================
      theme: ThemeData(
        primarySwatch: Theme.of(context).primaryColor,
      ),
//==========================================================================
// HOME
//==========================================================================
      home: Scaffold(
        primary: true,
        // backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Top Deals'),
        ),
//==========================================================================
// BODY
//==========================================================================
        body: Scaffold(
          backgroundColor: Colors.black,          
          appBar: AppBar(
            title: Text('www.lastminute.com'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.person), onPressed: () {})
            ],
          ),
          drawer: NavDrawerWidget(),
        ),
      ),
    );
  }
}
