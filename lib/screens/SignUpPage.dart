//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import '../models/InputSelectionModel.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/RadioHoriGroupWidget.dart';
import '../widgets/TextFieldWidget.dart';
import '../models/AppConfigModel.dart';

//==========================================================================
// CLASS
//==========================================================================
class SignUpPage extends StatefulWidget {
 
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

//==========================================================================
// STATE
//==========================================================================
class _SignUpPageState extends State<SignUpPage> {



  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final surnameController = TextEditingController(); 

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
          title: Text('Sign-up'),
        ),
//==========================================================================
// BODY
//==========================================================================
        body: 
        Container(
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: ListView(children: <Widget>[
            SizedBox(height: 8),
//==========================================================================
// TEXT: E-MAIL
//==========================================================================            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('E-mail',style: AppConfigModel().textStyleMBold),
            ),
            TextFieldWidget(text: '*E-mail', icon: Icons.email),
            SizedBox(height: 8),       
//==========================================================================
// TEXT: PERSONAL DETAIL
//==========================================================================                 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Personal Details',style: AppConfigModel().textStyleMBold),
            ),
            TextFieldWidget(text: '*Name', icon: Icons.account_box,controller: nameController,),
            TextFieldWidget(text: '*Surname', icon: Icons.account_circle,controller: surnameController,),   
//==========================================================================
// RADIO: SEX
//==========================================================================             
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RadioHoriGroupWidget(itemList: [InputSelectionModel(index: 1,name: "Male",),InputSelectionModel(index: 2,name: "Female",),]),
            ),                 
            SizedBox(height: 8),
//==========================================================================
// BUTTON
//==========================================================================      
            ButtonBarWidget(onPressed: () {
                  print(nameController.text);
                  print('TEST');                  

            },splashColor: Colors.pink,text: "Save",),            
          ],),
        ),
      ),
    );
  }
}
