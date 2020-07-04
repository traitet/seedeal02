//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:seedeal02/singletons/GlobalAppData.dart';
//==========================================================================
// MAIN CLASS
//==========================================================================
class TabPostDealWidget extends StatefulWidget {
//==========================================================================
// CONSTUCTURE
//==========================================================================  
  const TabPostDealWidget({
    Key key,
  }) : super(key: key);  
//==========================================================================
// OVERRIDE
//==========================================================================   
  @override
  _TabPostDealWidgetState createState() => _TabPostDealWidgetState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _TabPostDealWidgetState extends State<TabPostDealWidget> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  TextEditingController nameController = TextEditingController()..text = globalAppData.name;
  TextEditingController surnameController = TextEditingController();
  TextEditingController nationalityController = TextEditingController()..text = 'Thai';    
  TextEditingController emailController = TextEditingController()..text = globalAppData.email;
  TextEditingController mobileController = TextEditingController()..text = globalAppData.mobile;
  TextEditingController lineController = TextEditingController();     
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).primaryColor);
    return  Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          //leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white),onPressed: () => Navigator.of(context).pop(),),
          title: Text('Post Deal'),
          actions: <Widget>[
          ],
        ),
//==========================================================================
// BODY
//==========================================================================
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[

//==========================================================================
// SEARCH BAR
//==========================================================================

//==========================================================================
// LISTING
//==========================================================================

                
              ],
            ),
          ),
        ),
    );
  }
}
