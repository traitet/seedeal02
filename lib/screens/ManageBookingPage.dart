//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/TextFieldWidget.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class ManageBookingPage extends StatefulWidget {
  @override
  _ManageBookingPageState createState() => _ManageBookingPageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _ManageBookingPageState extends State<ManageBookingPage> {
  @override
  Widget build(BuildContext context) {
    const padding = 15.0;
    const paddingTop = 45.0;
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
        backgroundColor: Colors.black,

        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Car'),
        ),
//==========================================================================
// BODY
//==========================================================================
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: ListView(
              children: <Widget>[
                SizedBox(height: paddingTop),

//==========================================================================
// LISTTILE
//==========================================================================

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: ListTile(
                      title: Text(
                        'Manage Booking',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(Icons.edit, color: Colors.white)),
                ),

                SizedBox(height: padding),
//==========================================================================
// TEXT: WELCOME
//==========================================================================
                TextFieldWidget(text: 'E-mail', icon: Icons.email),
                TextFieldWidget(text: 'Contact', icon: Icons.people),
                SizedBox(height: padding),
//==========================================================================
// SIGN-IN BUTTON
//==========================================================================
                ButtonBarWidget(
                  onPressed: () {},
                  splashColor: Colors.pink,
                  text: "Login in",
                ),
                SizedBox(height: padding),
                SizedBox(height: padding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
