//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:seedeal02/widgets/tabpostdeal/LVPostDealVertWidget.dart';
import '../../widgets/LVVertSearchHotelWidget.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class TabPostDealOnlineWidget extends StatefulWidget {
  @override
  _TabPostDealOnlineWidgetState createState() => _TabPostDealOnlineWidgetState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _TabPostDealOnlineWidgetState extends State<TabPostDealOnlineWidget> {
  @override
  Widget build(BuildContext context) {
    // const padding = 15.0;

    // FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).primaryColor);
    return Scaffold(

//==========================================================================
// BODY
//==========================================================================
            body: SafeArea(
              child: Column(
                children: <Widget>[   
//==========================================================================
// SEARCH
//==========================================================================


//==========================================================================
// LISTVIEW & CARD
//==========================================================================
                  Expanded(child: Container(
                    child: LVVertSearchHotelWidget(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LVSearchDealVertWidget()),);},
                    ),
                  ))

//==========================================================================
// WIDGET
//==========================================================================
              ],
              ),
            ));
  }
}


