//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../screens/HomePage.dart';
import '../screens/MorePage.dart';
import '../screens/MyBookingPage.dart';
import '../screens/PaymentMethodPage.dart';
import '../screens/TravelBuddiesPage.dart';
import '../screens/LoginPage.dart';
import '../screens/PersonalDetailPage.dart';


//==========================================================================
// MAIN CLASS
//==========================================================================
class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _MyProfilePageState extends State<MyProfilePage> {
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
        // appBar: AppBar(
        //   title: Text('Login'),
        // ),
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
          currentIndex: 2,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business_center),
              title: Text('Booking'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('My Profile'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), title: Text('More')),
          ],
        ),
//==========================================================================
// BODY
//==========================================================================
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
//==========================================================================
// IMAGE
//==========================================================================
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/nueng.png'),
                          )),
                    ),
                    SizedBox(width: 15),
//==========================================================================
// COLUMN: TEXTS
//==========================================================================
                    Flexible(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Hi there!'),
                            Text('Traitet Thepbandansuk',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),


//==========================================================================
// LIST TILE & TEXT: MY PERFERENCE
//==========================================================================
    Text('My Preferences',style: TextStyle(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold)),
    SizedBox(height: 5),    
    ListTile(trailing: Icon(Icons.credit_card),title: Text('Payment Method'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethodPage()),);},),  
    ListTile(trailing: Icon(Icons.people),title: Text('Travel Buddy'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => TravelBuddiesPage()),);},),
    SizedBox(height: 15),   
//==========================================================================
// LIST TILE & TEXT: ACCOUNT SETTING
//==========================================================================              
    Text('Account Settings',style: TextStyle(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold)),     
    SizedBox(height: 5),        
    ListTile(trailing: Icon(Icons.chrome_reader_mode),title: Text('Personal Details & Password'),onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PersonalDetailPage()),);},),   
    ListTile(trailing: Icon(Icons.exit_to_app),title: Text('Logout'),onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()),);},),        
    


              ],

//==========================================================================
// LISTTILE
//==========================================================================


            ),
          ),
        ),
      ),
    );
  }
}
