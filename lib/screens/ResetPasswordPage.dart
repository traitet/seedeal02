//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/TextFieldWidget.dart';
import '../models/AppConfigModel.dart';

//==========================================================================
// CLASS
//==========================================================================
class ResetPasswordPage extends StatefulWidget {
 
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

//==========================================================================
// STATE
//==========================================================================
class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
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
          title: Text('Reset Password'),
        ),
//==========================================================================
// BODY
//==========================================================================
        body: 
        Container(
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: ListView(

            children: <Widget>[
//==========================================================================
// TEXT
//==========================================================================
           SizedBox(height: 72),      
          Center(child: Text('Forgot your password ?',style: AppConfigModel().textStyleXL)),
          SizedBox(height: 24),          
//==========================================================================
// TEXT
//==========================================================================  
          Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.all(8),
            child: Text(
              'To reset password, enter your e-mail, press the button and check mail to follow instruction',
              maxLines: 3,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: AppConfigModel().textStyleM),),      
          SizedBox(height: 36),                     
//==========================================================================
// TEXT: E-MAIL
//==========================================================================            
          TextFieldWidget(text: '*E-mail', icon: Icons.email, textInputType: TextInputType.emailAddress,),
          SizedBox(height: 36),   
//==========================================================================
// BUTTON
//==========================================================================      
          ButtonBarWidget(onPressed: () 
          {
            print(emailController.text);
            //FILL CODE
          },splashColor: Colors.pink,text: "Reset Password",),             
          ],),
        ),
      ),
    );
  } //BUILD WIDGET 
} // CLASS
