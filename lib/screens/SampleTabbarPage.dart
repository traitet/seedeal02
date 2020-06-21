//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class SampleTabbarPage extends StatefulWidget {
  @override
  _SampleTabbarPageState createState() => _SampleTabbarPageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _SampleTabbarPageState extends State<SampleTabbarPage> {
  @override
  Widget build(BuildContext context) {
    // const padding = 15.0;
    // const paddingTop = 45.0;
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
// HOME: DEFAULT TAB CONTROLLER
//==========================================================================
      home: DefaultTabController(
//==========================================================================
// NUMBER OF TAB
//==========================================================================        
        length: choices.length,
        child: Scaffold(
//==========================================================================
//APPBAR
//==========================================================================          
          appBar: AppBar(
            title: Text('Search Top Deal'),
//==========================================================================
// APPBAR: BOTTOM
//==========================================================================            
            bottom: TabBar(
              // isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
//==========================================================================
// SCAFFOLD: BODY
//==========================================================================          
          body: ListView(
            children: <Widget>[
              TabBarView(
                children: choices.map((Choice choice) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ChoiceCard(choice: choice),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//==========================================================================
// CLASS CHOICE
//==========================================================================
class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Hotel + Car', icon: Icons.hotel),
  const Choice(title: 'Train', icon: Icons.train),
];

//==========================================================================
// CLASS: CLOICECARD
//==========================================================================
class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;
//==========================================================================
// BUILD WIDGET
//==========================================================================
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
//==========================================================================
// CARD
//==========================================================================    
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
