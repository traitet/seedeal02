//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../models/AppConfigModel.dart';
import '../screens/HomePage.dart';
import '../widgets/ButtonBarWidget.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    const padding = 15.0;
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
        // appBar: AppBar(
        //   title: Text('Login'),
        // ),
//==========================================================================
// BODY
//==========================================================================
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
      
//==========================================================================
// TEXT: WELCOME
//==========================================================================
Image(image: AssetImage('assets/images/welcome.JPG')),

//==========================================================================
// TEXT: JOIN US
//==========================================================================                
                Center(
                    child: Text('Join us now to discover our hot deals!',
                    style: AppConfigModel().textStyleM)),
                SizedBox(height: padding),                        
//==========================================================================
// TEXT: LOGIN
//==========================================================================                        
                Center(
                    child: Text(
                  'Login',
                  style: AppConfigModel().textStyleM,
                )),
                SizedBox(height: padding),
//==========================================================================
// FACEBOOK BUTTON
//==========================================================================                
                FacebookSignInButton(onPressed: () {
                  login();
                  // call authentication logic
                }),
                SizedBox(height: padding),
//==========================================================================
// GOOGLE BUTTON
//==========================================================================                
                GoogleSignInButton(
                  onPressed: () {
                    login();
                  // call authentication logic
                  },
                  splashColor: Colors.white,
                  // setting splashColor to Colors.transparent will remove button ripple effect.
                ),
                SizedBox(height: padding),
//==========================================================================
// APPGLE BUTTON
//==========================================================================                
                AppleSignInButton(
                  onPressed: () {
                    login();
                  // call authentication logic
                  },
                  //splashColor: Colors.white,
                  // setting splashColor to Colors.transparent will remove button ripple effect.
                ),
                SizedBox(height: padding),                
//==========================================================================
// SIGN-IN BUTTON
//==========================================================================                
                ButtonBarWidget(
                  onPressed: () {
                    login();
                    // call authentication logic
                  },
                  splashColor: Colors.pink,
                  text: "Sign in",
                ),
                SizedBox(height: padding),
                SizedBox(height: padding),
//==========================================================================
// TEXT
//==========================================================================                     
                Center(
                    child: Text(
                  "Haven't got an account?",
                  style: AppConfigModel().textStyleM,
                )),
                SizedBox(height: padding),
//==========================================================================
// CREATE ACCOUNT BUTTON
//==========================================================================                
                FlatButton(
                  onPressed: () {},
                  child: Text('Create an Account',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue[800])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//==========================================================================
// LOGIN FUNCTION
//==========================================================================   
login()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),);

}
