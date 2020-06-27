//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../screens/BookingPage.dart';
import '../screens/SearchFlightHotelPage.dart';
import '../screens/SearchHotelPage.dart';
import '../screens/AddTravellerPage.dart';
import '../screens/PaymentMethodPage.dart';
import '../screens/TravelBuddiesPage.dart';
import '../screens/ManageBookingPage.dart';
import '../screens/LoginPage.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class TabMoreWidget extends StatelessWidget {
//==========================================================================
// CONSTRUCTURE
//==========================================================================  
  const TabMoreWidget({
    Key key,
  }) : super(key: key);
//==========================================================================
// OVERRIDE BUILD WIDGET
//==========================================================================  
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).primaryColor);
    return 
//==========================================================================
// SCAFFOLD
//==========================================================================   
    Scaffold(
        appBar: AppBar(title: Text('More'),),
//==========================================================================
// BODY
//==========================================================================
        body: 
        ListView(
          children: <Widget>[
//==========================================================================
// IMAGE
//==========================================================================

//==========================================================================
// LIST TILE & TEXT: MY PERFERENCE
//==========================================================================  
            ListTile(trailing: Icon(Icons.home),title: Text('Booking'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage()),);},),  
            ListTile(trailing: Icon(Icons.home),title: Text('Flight + Hotel'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SearchFlightHotelPage()),);},),  
            ListTile(trailing: Icon(Icons.hotel),title: Text('Hotels'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SearchHotelPage()),);},),     
            ListTile(trailing: Icon(Icons.flight),title: Text('Flights'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SearchFlightHotelPage()),);},),   
            ListTile(trailing: Icon(Icons.book),title: Text('Manage Booking'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ManageBookingPage()),);},),   
            ListTile(trailing: Icon(Icons.people),title: Text('Travel Buddies'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => TravelBuddiesPage()),);},),   
            ListTile(trailing: Icon(Icons.credit_card),title: Text('Edit Payment Method'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethodPage()),);},),  
            ListTile(trailing: Icon(Icons.person),title: Text('Add Traveller'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AddTravellerPage()),);},),                                                      
            ListTile(trailing: Icon(Icons.help),title: Text('Need help?'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AddTravellerPage()),);},),         
            ListTile(trailing: Icon(Icons.rate_review),title: Text('Rate the app'),),      
            ListTile(trailing: Icon(Icons.web),title: Text('About'),onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()),);},),         
          ],
//==========================================================================
// LISTTILE
//==========================================================================
        ),
      );
  }
}
