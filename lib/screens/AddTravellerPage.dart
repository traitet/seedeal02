//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/RadioHoriGroupWidget.dart';
import '../widgets/TextFieldWidget.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class AddTravellerPage extends StatefulWidget {
  @override
  _AddTravellerPageState createState() => _AddTravellerPageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _AddTravellerPageState extends State<AddTravellerPage> {
  @override
  Widget build(BuildContext context) {
    const padding = 15.0;
    const paddingTop = 5.0;
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
        // backgroundColor: Colors.white,

        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Add Traveller'),
        ),
//==========================================================================
// BODY
//==========================================================================
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(height: paddingTop),

//==========================================================================
// TEXT: WELCOME
//==========================================================================
                Text('Personal Details',style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                TextFieldWidget(text: '*Name', icon: Icons.account_box),
                TextFieldWidget(text: '*Surname', icon: Icons.account_circle),
                TextFieldWidget(text: '*Expiration Dates', icon: Icons.timer),
//==========================================================================
// RADIO: GENDER
//==========================================================================
                RadioHoriGroupWidget(),
//==========================================================================
// DROPDOWN: NATIONALITY
//==========================================================================
                TextFieldWidget(text: '*Nationality', icon: Icons.people),
//==========================================================================
// TEXT: CONTACT DEAIL
//==========================================================================
                Text('Contact Details test',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
//==========================================================================
// TEXTFIELD
//==========================================================================
                TextFieldWidget(text: '*E-mail', icon: Icons.email),
                TextFieldWidget(text: '*Mobile', icon: Icons.phone),
//==========================================================================
// TEXT
//==========================================================================
                Text(
                    'For bookings confirmation and in the case of an emergency',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),

                SizedBox(height: padding),
//==========================================================================
// SIGN-IN BUTTON
//==========================================================================
                ButtonBarWidget(
                  onPressed: () {},
                  splashColor: Colors.pink,
                  text: "Save",
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
