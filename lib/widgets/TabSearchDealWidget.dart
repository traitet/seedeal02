//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:seedeal02/services/LoggerService.dart';
import '../widgets/TabSearchDealTabHotelFlightWidget.dart';
import '../widgets/TabSearchDealTabHotelWidget.dart';
import '../widgets/TabSearchDealTabTrainWidget.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class TabSearchDealWidget extends StatefulWidget {
  @override
  _TabSearchDealWidgetState createState() => _TabSearchDealWidgetState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _TabSearchDealWidgetState extends State<TabSearchDealWidget> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).primaryColor);
    return 
    DefaultTabController(
//==========================================================================
// NUMBER OF TAB
//==========================================================================
        // initialIndex: _tabSearchDealIndex,
        length: choices.length,
        child: Scaffold(
//==========================================================================
//APPBAR
//==========================================================================
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            //leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,),onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),)),            
            centerTitle: false,
            title: Text('Search Top Deal'),
//==========================================================================
// APPBAR: BOTTOM
//==========================================================================
            bottom: TabBar(
              onTap: (int index){setState(() {
                tabIndex = index;
                logger.i(index.toString());
              });},  
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
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Container(
                color: Colors.black87,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: 
                    tabIndex == 0 ? TabSearchDealTabHotelFlightWidget():
                    tabIndex == 1 ? TabSearchDealTabTrainWidget():
                    tabIndex == 2 ? TabSearchDealTabHotelWidget():
                    null                     
                ),
              );
            }).toList(),
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
//==========================================================================
// LIST
//==========================================================================
const List<Choice> choices = const <Choice>[
  const Choice(title: 'Hotel + Flight', icon: Icons.flight),
  const Choice(title: 'Train', icon: Icons.train),
  const Choice(title: 'Hotel', icon: Icons.hotel),
];

