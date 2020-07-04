//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../screens/HomePage.dart';
import '../screens/SearchDealHotelPage.dart';
import '../screens/SearchDealTrainPage.dart';
import '../screens/SearchHotelPage.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/DatePickerWidget.dart';
import '../widgets/DropdownBarWidget.dart';


//==========================================================================
// MAIN CLASS
//==========================================================================
class SearchDealFlightHotelPage extends StatefulWidget {
  @override
  _SearchDealFlightHotelPageState createState() => _SearchDealFlightHotelPageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _SearchDealFlightHotelPageState extends State<SearchDealFlightHotelPage> {
  @override
  Widget build(BuildContext context) {
    // const padding = 15.0;
    // const paddingTop = 45.0;
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
// HOME: DEFAULT TAB CONTROLLER
//==========================================================================
      home: DefaultTabController(
//==========================================================================
// NUMBER OF TAB
//==========================================================================
        initialIndex: 0,
        length: choices.length,
        child: Scaffold(
//==========================================================================
//APPBAR
//==========================================================================
          appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),)),            
            title: Text('Search Top Deal: Flight + Hotel'),
//==========================================================================
// APPBAR: BOTTOM
//==========================================================================
            bottom: TabBar(
              onTap: (int index){
                switch (index) {
                  case 0: {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchDealFlightHotelPage()),);}break;
                  case 1: {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchDealTrainPage()),);}break;
                  case 2: {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchDealHotelPage()),);}break;              
                  default:
                }
              },              
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
                  child: ChoiceCard(choice: choice),
                ),
              );
            }).toList(),
          ),
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
// CLASS CHOICE
//==========================================================================
const List<Choice> choices = const <Choice>[
  const Choice(title: 'Flight + Hotel', icon: Icons.flight),
  const Choice(title: 'Train', icon: Icons.train),
  const Choice(title: 'Hotel', icon: Icons.hotel),
];

//==========================================================================
// CLASS: CLOICECARD
//==========================================================================
class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;
//==========================================================================
// BUILD WIDGET
//==========================================================================
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



