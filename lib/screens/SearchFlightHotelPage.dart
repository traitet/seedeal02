//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../screens/SearchHotelPage.dart';
import '../widgets/ButtonBarWidget.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class SearchFlightHotelPage extends StatefulWidget {
  @override
  _SearchFlightHotelPageState createState() => _SearchFlightHotelPageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _SearchFlightHotelPageState extends State<SearchFlightHotelPage> {
  @override
  Widget build(BuildContext context) {
//==========================================================================
// HEADER STATUS BAR COLOR
//==========================================================================    
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
// SCAFFOLD
//==========================================================================      
      home: Scaffold(
        appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                  onPressed: () => Navigator.of(context).pop(),
                  ),          
          title: Text('Flight and Hotel'),
        ),
        body: buildBody(),
      ),
    );
  }

//==========================================================================
// BUILD BODY
//==========================================================================
  buildBody() => Container(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
//==========================================================================
// TEXT
//==========================================================================
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(9),
                child: Text('Leaving from')),
//==========================================================================
// TEXT INPUT
//==========================================================================
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Departure Airport',
                  prefixIcon: Icon(Icons.flight_takeoff)),
            ),
//==========================================================================
// TEXT
//==========================================================================
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(9),
                child: Text('Going to')),
//==========================================================================
// TEXT INPUT
//==========================================================================
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Arrival Airport', prefixIcon: Icon(Icons.flight_land)),
            ),
//==========================================================================
// ROW
//==========================================================================
            Row(
              children: <Widget>[
//==========================================================================
// CARD
//==========================================================================
                Expanded(
                  child: Card(
                      color: Colors.white,
                      child: Container(height: 100,width: 200,
                          child: InkWell(
                              onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) =>SearchFlightHotelPage()),);},
                              child: Column(children: <Widget>[
                                Container(
                                    padding: EdgeInsets.only(
                                    left: 8, top: 15, bottom: 20),
                                    child: Text('Leaving on',style: TextStyle(color: Colors.pink, fontSize: 15),)),
                                Container(
                                    child: Text('Tonight',style:TextStyle(color: Colors.grey, fontSize: 15),
                                )),
                              ])))),
                ),
//==========================================================================
// CARD
//==========================================================================
                Expanded(child: Card(
                      color: Colors.white,
                      child: Container(
                          height: 100,
                          width: 200,
                          child: InkWell(
                              onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => SearchFlightHotelPage()),                                
                              );},
                              child: Column(children: <Widget>[
                                Container(
                                    padding: EdgeInsets.only(left: 8, top: 15, bottom: 20),
                                    child: Text('Returning on',style: TextStyle(color: Colors.pink, fontSize: 15),)),
                                Container(child: Text('Tonight',style: TextStyle(color: Colors.grey, fontSize: 15),)),
                              ])))),
                ),                        
                  ],),
 //==========================================================================
// BUTTON
//==========================================================================
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ButtonBarWidget(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SearchHotelPage()),);},
                    splashColor: Colors.pink,
                    text: "Find",
                  ),
                )                 


              
//==========================================================================
// COLUMN
//==========================================================================            
          ],
        ),
      );
}
