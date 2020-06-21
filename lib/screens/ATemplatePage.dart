//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
// import 'package:seedeal01/widgets/ButtonBarWidget.dart';
// import 'package:seedeal01/widgets/RadioButtonWidget.dart';
// import 'package:seedeal01/widgets/TextFieldWidget.dart';
// import '../models/AppConfigModel.dart';

//==========================================================================
// CLASS
//==========================================================================
class ATemplatePage extends StatefulWidget {
  @override
  _ATemplatePageState createState() => _ATemplatePageState();
}

//==========================================================================
// STATE
//==========================================================================
class _ATemplatePageState extends State<ATemplatePage> {
  @override
  Widget build(BuildContext context) {
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
          title: Text('Personal'),
        ),
//==========================================================================
// BODY
//==========================================================================
        body: Container(
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: ListView(children: <Widget>[
            
            // Text('E-mail',style: AppConfigModel().textStyleMBold),
            // TextFieldWidget(text: '*E-mail', icon: Icons.email),
            // SizedBox(height: 8),            
            // Text('Personal Details',style: AppConfigModel().textStyleMBold),
            // TextFieldWidget(text: '*Name', icon: Icons.account_box),
            // TextFieldWidget(text: '*Surname', icon: Icons.account_circle),    
            // RadioButtonWidget(),                    
            // SizedBox(height: 8),
            // ButtonBarWidget(onPressed: () {},splashColor: Colors.pink,text: "Save",),            
          ],),
        ),
      ),
    );
  }
}
