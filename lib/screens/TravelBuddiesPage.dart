//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import '../widgets/ButtonBarWidget.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class TravelBuddiesPage extends StatefulWidget {
  @override
  _TravelBuddiesPageState createState() => _TravelBuddiesPageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _TravelBuddiesPageState extends State<TravelBuddiesPage> {
  @override
  Widget build(BuildContext context) {
    const padding = 15.0;
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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Travel Buddies'),
        ),

//==========================================================================
// BODY
//==========================================================================
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
//==========================================================================
// TEXT: WELCOME
//==========================================================================
                SizedBox(height: padding),

//==========================================================================
// TEXT: JOIN US
//==========================================================================
                Center(
                  child: Text('Saved travellers',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Center(
                  child: Text('Appeal Here',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 15),
                Center(
                  child: Text('Saving traveller details is cool because',
                      style: TextStyle(fontSize: 14)),
                ),
                Center(
                  child: Text(
                      "It saves you time (you won't have to",
                      style: TextStyle(fontSize: 14)),
                ),
                Center(
                  child: Text(
                      "enter them again).",
                      style: TextStyle(fontSize: 14)),
                ),                
                SizedBox(height: padding),
//==========================================================================
// EXPAND
//==========================================================================
                Expanded(
                  child: Container(),
                ),
//==========================================================================
// BUTTON: ADD TRAVELLER
//==========================================================================                
                SizedBox(
                  width: double.infinity,
                  child: ButtonBarWidget(
                    onPressed: () {},
                    splashColor: Theme.of(context).primaryColor,
                    text: "Add traveller",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
