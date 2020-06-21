//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../screens/MyProfilePage.dart';
import '../screens/HomePage.dart';
import '../screens/MyBookingPage.dart';
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
class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _MorePageState extends State<MorePage> {
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
        appBar: AppBar(title: Text('More'),),
//==========================================================================
// BUTTOM NAVIGATION BAR
// www.willowtreeapps.com/ideas/how-to-use-flutter-to-build-an-app-with-bottom-navigation
//==========================================================================
        bottomNavigationBar: BottomNavigationBar(
              onTap: (int index){
                switch (index) {
                  case 0: {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);}break;
                  case 1: {Navigator.push(context, MaterialPageRoute(builder: (context) => MyBookingPage()),);}break;
                  case 2: {Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilePage()),);}break;
                  case 3: {Navigator.push(context, MaterialPageRoute(builder: (context) => MorePage()),);}break;                  
                  default:
                }
              },          
          type: BottomNavigationBarType.fixed,
          currentIndex: 3,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home'),),
            BottomNavigationBarItem(icon: Icon(Icons.business_center),title: Text('Booking'),),
            BottomNavigationBarItem(icon: Icon(Icons.person),title: Text('My Profile'),),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), title: Text('More')),
          ],
        ),
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
      ),
    );
  }
}
