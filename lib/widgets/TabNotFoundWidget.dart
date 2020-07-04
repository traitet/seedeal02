//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class TabNotFoundWidget extends StatelessWidget {
//==========================================================================
// CONSTUCTURE
//==========================================================================  
  const TabNotFoundWidget({
    Key key,
  }) : super(key: key);
//==========================================================================
// OVERRIDE BUILD WIDGET
//==========================================================================
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).primaryColor);
    return 
//==========================================================================
// RETURN
//==========================================================================    
    SafeArea(
         child: Container(
           alignment: Alignment.center,
           color: Theme.of(context).primaryColor,
           child: Text('Under Construction', style: TextStyle(fontSize: 30, color: Colors.white),)),
    );
  }
}
