import 'package:flutter/material.dart';
import '../screens/AddTravellerPage.dart';
import '../screens/PaymentMethodPage.dart';
import '../screens/LoginPage.dart';
import '../main.dart';


// import '../main.dart';

class NavDrawerWidget extends StatefulWidget {
  
  @override
  _NavDrawerWidgetState createState() => _NavDrawerWidgetState();
}

class _NavDrawerWidgetState extends State<NavDrawerWidget> {
  
  @override
  Widget build(BuildContext context) {
          //===================================================
          // 1) RETURN DRAWER WIDGET
          //===================================================     
    return Drawer(
          //===================================================
          // 2) DATA IN DRAWER IS CHILD: LISTVIEW()
          //===================================================       
      child: ListView(
        padding: EdgeInsets.zero,
        children:<Widget> [
          //===================================================
          // 3) FILL HEADER NAME
          //===================================================           

          //===================================================
          // 4) ADD LIST OF MENU
          //=================================================== 
          ListTile(leading: Icon(Icons.verified_user), trailing: Icon(Icons.expand_more), title: Text('traitet@gmail.com'),subtitle: Text('Sign-in'),),           
          ListTile(leading: Icon(Icons.date_range), title: Text('Hotel'),onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => AddTravellerPage()),)},),  
          ListTile(leading: Icon(Icons.rotate_right), title: Text('Car + Hotel'),onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethodPage()),)},),             
          ListTile(leading: Icon(Icons.verified_user), title: Text('Flight'),onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),)},),    
          ListTile(leading: Icon(Icons.hotel), title: Text('Holidays'),onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),)},),                         
          ListTile(leading: Icon(Icons.exit_to_app), title: Text('Logout'),onTap: () { 
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
              //signOut(context);
            },  // on Tap
          ),    //my app = main page
        ],

      ),
    ); 
   } // WIDGET
} // CLASS