//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../screens/HotelDetailPage.dart';
import '../screens/MorePage.dart';
import '../screens/MyBookingPage.dart';
import '../screens/MyProfilePage.dart';
import '../screens/SearchDealFlightHotelPage.dart';
import '../screens/SearchDealHotelPage.dart';
import '../screens/SearchDealTrainPage.dart';
import '../widgets/LVHoriSearchDealWidget.dart';

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
              currentIndex: 0,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text('Home')   
                    ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business_center),
                  title: Text('Booking'),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), title: Text('My Profile')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz), title: Text('More')),
              ],
            ),
//==========================================================================
// BODY
//==========================================================================
            body: ListView(
              children: <Widget>[
//==========================================================================
// IMAGE
//==========================================================================
                Image(image: AssetImage('assets/images/tophome.JPG')),
//==========================================================================
// TAB BAR
//==========================================================================
                Container(
                  height: 80,
                  color: Colors.pink,
                  child: DefaultTabController(
                    initialIndex: 0,
                    length: choices.length,
                    child: TabBar(
                    onTap: (int index){
                      switch (index) {
                        case 0: {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchDealFlightHotelPage()),);}break;
                        case 1: {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchDealTrainPage()),);}break;
                        case 2: {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchDealHotelPage()),);}break;              
                        default:
                      }
                    },                            
                      tabs: choices.map((Choice choice) {
                        return Tab(
                          text: choice.title,
                          icon: Icon(choice.icon),
                        );
                      }).toList(),
                    ),
                  ),
                ),
//==========================================================================
// TOP DEAL
//==========================================================================
      Padding(
        padding: const EdgeInsets.only(right: 8,left: 8, top: 8, bottom: 4),
        child: Text('Top Deals',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),), 
      ),
//==========================================================================
// LIST VIEW HORIZONAL
//==========================================================================   
      LVHoriSearchDealWidget(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetailPage()),);},), 
//==========================================================================
// TOP DEAL
//==========================================================================
      Padding(
        padding: const EdgeInsets.only(right: 8,left: 8, top: 8, bottom: 4),
        child: Text('Something extra for your trip?',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),), 
      ),
 //==========================================================================
// IMAGE
//==========================================================================           
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(image: AssetImage('assets/images/lady.JPG')),
      ),
//==========================================================================
// WIDGET
//==========================================================================
            ],
            )));
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
// CLASS CHOICE
//==========================================================================
const List<Choice> choices = const <Choice>[
  Choice(title: 'Flight + Hotel', icon: Icons.flight),
  Choice(title: 'Train', icon: Icons.tram),
  Choice(title: 'Hotel', icon: Icons.hotel),
];
