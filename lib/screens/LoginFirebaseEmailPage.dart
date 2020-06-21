//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:seedeal02/screens/HomePage.dart';
import 'package:seedeal02/services/FirebaseAuthenService.dart';
import 'package:seedeal02/services/LoggerService.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/TextFieldWidget.dart';
import '../models/AppConfigModel.dart';

//==========================================================================
// CLASS
//==========================================================================
class LoginFirebaseEmailPage extends StatefulWidget {
 
  @override
  _LoginFirebaseEmailPageState createState() => _LoginFirebaseEmailPageState();
}

//==========================================================================
// STATE
//==========================================================================
class _LoginFirebaseEmailPageState extends State<LoginFirebaseEmailPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController()..text = 'tratiet@gmail.com';
    final passwordController = TextEditingController()..text = 'computer';    
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
          title: Text('Login'),
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
//==========================================================================
// TEXT
//==========================================================================  
          Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.all(8),
            child: Text(
              'Fill Username and password. Then, click login to enter the system',
              maxLines: 3,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: AppConfigModel().textStyleM),),      
          SizedBox(height: 24),                     
//==========================================================================
// TEXT: E-MAIL
//==========================================================================            
          TextFieldWidget(text: '*E-mail', icon: Icons.email, textInputType: TextInputType.emailAddress,),
          TextFieldWidget(text: '*Password', icon: Icons.vpn_key, ),          
          SizedBox(height: 24),   
//==========================================================================
// BUTTON
//==========================================================================      
          ButtonBarWidget(onPressed: () {
            logger.i(emailController.text);
            loginWithEmail(context, email: emailController.text, password: passwordController.text)
            .then((bool isComplete) {isComplete ?? Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));}
         ).catchError((e) => logger.i(e));
          },splashColor: Colors.pink,text: "Login",),      
                         
          ],),

          
        ),
      ),
    );
  } //BUILD WIDGET 
} // CLASS




