//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import '../widgets/ButtonBarWidget.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class TabBookingWidget extends StatelessWidget {
//==========================================================================
// CONSTUCTURE
//==========================================================================  
  const TabBookingWidget({
    Key key,
  }) : super(key: key);
//==========================================================================
// OVERRIDE BUILD WIDGET
//==========================================================================
  @override
  Widget build(BuildContext context) {
    const padding = 15.0;
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).primaryColor);
    return 
//==========================================================================
// RETURN
//==========================================================================    
    Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
//==========================================================================
// TEXT: WELCOME
//==========================================================================
                Image(image: AssetImage('assets/images/mybooking.JPG')),
                SizedBox(height: padding),

//==========================================================================
// TEXT: JOIN US
//==========================================================================
                Center(
                  child: Text('Hi Traitet!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 5),
                Center(
                  child: Text('We cannot find any bookings with',
                      style: TextStyle(fontSize: 14)),
                ),
                Center(
                  child: Text('traitet@gmail.com',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Center(
                  child: Text("If you've booked with another email",
                      style: TextStyle(fontSize: 14)),
                ),
                Center(
                  child: Text("address, you can link it to this account ",
                      style: TextStyle(fontSize: 14)),
                ),
                Center(
                  child: Text("and we'll import your trip details.",
                      style: TextStyle(fontSize: 14)),
                ),
                SizedBox(height: padding),

//==========================================================================
// SIGN-IN BUTTON
//==========================================================================
                ButtonBarWidget(
                  onPressed: () {},
                  splashColor: Colors.pink,
                  text: "Add E-mail",
                ),
                SizedBox(height: padding),
                SizedBox(height: padding),
//==========================================================================
// TEXT
//==========================================================================
                Center(
                  child: Text("You can find the details",
                      style: TextStyle(fontSize: 14)),
                ),
                Center(
                  child: Text("for your pass bookings",
                      style: TextStyle(fontSize: 14)),
                ),
                Center(
                  child:
                      Text("by tapping below", style: TextStyle(fontSize: 14)),
                ),
//==========================================================================
// CREATE ACCOUNT BUTTON
//==========================================================================
                FlatButton(
                  onPressed: () {},
                  child: Text('Past Booking',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blue[800])),
                ),
              ],
            )
          )
    );
  }
}
