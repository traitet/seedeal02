//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import '../screens/SearchHotelPage.dart';
import 'ButtonBarWidget.dart';
import 'DropdownBarWidget.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class TabSearchDealTabHotelWidget extends StatefulWidget {
//==========================================================================
// CONSTUCTURE
//==========================================================================  
  const TabSearchDealTabHotelWidget({
    Key key,
  }) : super(key: key);
//==========================================================================
// OVERRIDE BUILD WIDGET
//==========================================================================  
  @override
  _TabSearchDealTabHotelWidgetState createState() => _TabSearchDealTabHotelWidgetState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _TabSearchDealTabHotelWidgetState extends State<TabSearchDealTabHotelWidget> {
  @override
  Widget build(BuildContext context) {

    // final textStyle1 = TextStyle(color: Colors.white, fontSize: 16);
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
            height: 500,
            width: double.infinity,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

//==========================================================================
// DATAPICKER WIDGET
//==========================================================================
                DropdownBarWidget(
                    hintIcon: Icons.location_city,
                    hintText: 'London, United Kingdom',
                    dropdownColor: Colors.white),
//==========================================================================
// GRIDVIEW
//==========================================================================
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),                  
                  height: 120,
                  child: GridView.count(
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 5,
                    crossAxisCount: 2,
                    children: <Widget>[
                      cardBuild(context, 'Check-in', 'Tonight'),
                      cardBuild(context, 'Check-out', 'Tomorrow'),
                    ],
                  ),
                ),                    
//==========================================================================
// DROPDOWN: NO GUESTS
//==========================================================================
                DropdownBarWidget(
                    hintIcon: Icons.person,
                    hintText: '2 adults, 1 room',
                    dropdownColor: Colors.white),
//==========================================================================
// EXPANDED
//==========================================================================
                //Expanded(child: Container()),
//==========================================================================
// BUTTON
//==========================================================================
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ButtonBarWidget(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SearchHotelPage()),);},
                    splashColor: Colors.pink,
                    text: "Find",
                  ),
                )
              ],
            )),
      ],
    );
  }

//==========================================================================
// CARD
//==========================================================================
  Card cardBuild(BuildContext context, String title, String subTitle) => Card(
        // elevation: 1,
        margin: EdgeInsets.only(top: 4, bottom: 4),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,              
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 16),                
                Text(title,style: TextStyle(fontSize: 24, color: Colors.pink),),
                SizedBox(height: 16),
                Text(subTitle,style: TextStyle(fontSize: 16, color: Colors.grey),),
              ],
            ),
          ),
        ),
      );
}
