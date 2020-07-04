//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:seedeal02/widgets/DatePickerWidget.dart';
import '../screens/SearchHotelPage.dart';
import 'ButtonBarWidget.dart';
import 'DropdownBarWidget.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class TabSearchDealTabHotelFlightWidget extends StatefulWidget {
//==========================================================================
// CONSTUCTURE
//==========================================================================  
  const TabSearchDealTabHotelFlightWidget({
    Key key,
  }) : super(key: key);
//==========================================================================
// OVERRIDE BUILD WIDGET
//==========================================================================  
  @override
  _TabSearchDealTabHotelFlightWidgetState createState() => _TabSearchDealTabHotelFlightWidgetState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _TabSearchDealTabHotelFlightWidgetState extends State<TabSearchDealTabHotelFlightWidget> {
  @override
  Widget build(BuildContext context) {
    //final TextStyle textStyle1 = Theme.of(context).textTheme.bodyText1;
    final textStyle1 = TextStyle(color: Colors.white,fontSize: 16);
//==========================================================================
// CARD
//==========================================================================
    return ListView(
      children: <Widget>[
//==========================================================================
// RETURN/ONEWAY
//==========================================================================
        Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                
//==========================================================================
// DROPDOWN: FROM
//==========================================================================
                Text('From', style: textStyle1),
                DropdownBarWidget(hintIcon: Icons.flight_takeoff, hintText: 'From'),
                SizedBox(height: 4),
//==========================================================================
// DROPDOWN: TO
//==========================================================================
                Text('To', style: textStyle1),
                DropdownBarWidget(hintIcon: Icons.flight_land, hintText: 'To'),
//==========================================================================
// DATAPICKER WIDGET
//==========================================================================  
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(flex:1,child: DatePickerWidget()),
                      DatePickerWidget(),   
                    ],
                  ),
                ),
              
//==========================================================================
// DROPDOWN: NO GUESTS 
//==========================================================================
                DropdownBarWidget(hintIcon: Icons.person,hintText: '2 adults, 1 room',dropdownColor: Colors.grey),
//==========================================================================
// DROPDOWN: CLASS
//==========================================================================                
                DropdownBarWidget(hintIcon: Icons.airline_seat_recline_normal,hintText: 'any class',dropdownColor: Colors.grey),
                SizedBox(height: 16),
//==========================================================================
// EXPANDED
//==========================================================================
        //Expanded(child: Container()),                
//==========================================================================
// BUTTON
//==========================================================================
        SizedBox(
          width: double.infinity,
          child: ButtonBarWidget(
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SearchHotelPage()),);},
            splashColor: Theme.of(context).primaryColor,
            text: "Find",
          ),
        )                
              ],
            )),


      ],
    );


  }
}

