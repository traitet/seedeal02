//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:seedeal02/widgets/TabPostDealWidget.dart';
import '../widgets/TabHomeWidget.dart';
import '../widgets/TabMoreWidget.dart';
import '../widgets/TabMyProfileWidget.dart';
import '../widgets/TabNotFoundWidget.dart';
import '../widgets/TabSearchDealWidget.dart';
import '../widgets/TabSearchWidget.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _HomePageState extends State<HomePage> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  int _tabIndex = 0;
//==========================================================================
// OVERRIDE BUILD WIDGET
//==========================================================================  
  @override
  Widget build(BuildContext context) {
    // const padding = 15.0;
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
            // appBar: AppBar(title: Text(globalAppData.userName),),
//==========================================================================
// BUTTOM NAVIGATION BAR
// www.willowtreeapps.com/ideas/how-to-use-flutter-to-build-an-app-with-bottom-navigation
//==========================================================================
            bottomNavigationBar: BottomNavigationBar(
//==========================================================================
// ONTAB -> SETSTATE
//==========================================================================              
              onTap: (int index){setState(() {_tabIndex = index;});},
//==========================================================================
//BOTTM NAVIGATIONBAR
//==========================================================================                  
              type: BottomNavigationBarType.fixed,
              currentIndex: _tabIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home') ),
                BottomNavigationBarItem(icon: Icon(Icons.assignment_ind),title: Text('Deal'),),                
                BottomNavigationBarItem(icon: Icon(Icons.search),title: Text('Search'),),
                BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
                BottomNavigationBarItem(icon: Icon(Icons.insert_comment), title: Text('Post Deal')),                    
                BottomNavigationBarItem(icon: Icon(Icons.more_horiz), title: Text('More')),
              ],
            ),
//==========================================================================
// BODY
//==========================================================================
            body:
                    _tabIndex == 0 ? TabHomeWidget():
                    _tabIndex == 1 ? TabSearchDealWidget():
                    _tabIndex == 2 ? TabSearchWidget():
                    _tabIndex == 3 ? TabMyProfileWidget():     
                    _tabIndex == 4 ? TabPostDealWidget():                              
                    _tabIndex == 5 ? TabMoreWidget(): 
                    TabNotFoundWidget()                 
//==========================================================================
// END: SCAFFOLD & MATERIAL APP
//==========================================================================            
    ));
//==========================================================================
// END: OVERRIDE & CLASS
//==========================================================================
  }}

