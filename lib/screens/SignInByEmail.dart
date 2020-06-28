//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:seedeal02/screens/LoginPage.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/TextFieldWidget.dart';
import '../models/AppConfigModel.dart';

//==========================================================================
// CLASS
//==========================================================================
class SignInByEmailPage extends StatefulWidget {
 
  @override
  _SignInByEmailPageState createState() => _SignInByEmailPageState();
}

//==========================================================================
// STATE
//==========================================================================
class _SignInByEmailPageState extends State<SignInByEmailPage> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
//==========================================================================
// OVERRIDE BUILD WIDGET
//==========================================================================  
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
//==========================================================================
// ** NEED TO BACK CALLING PAGE ** (NOT ONLY LOGIN)
//==========================================================================            
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);}
          ),
          title: Text('Sign-in by E-mail'),
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
            Padding(padding: const EdgeInsets.all(8.0),child: Text('E-mail',style: AppConfigModel().textStyleMBold)),
            TextFieldWidget(controller: _emailController,text: '*E-mail', icon: Icons.email, textInputType: TextInputType.emailAddress,),
            TextFieldWidget(controller: _passwordController,text: '*Password', icon: Icons.vpn_key, textInputType: TextInputType.visiblePassword,obscureText: true,),     
            SizedBox(height: 16),       

//==========================================================================
// BUTTON
//==========================================================================      
            ButtonBarWidget(onPressed: () {
              //firebaseCreateUserWithEmailAndPassword(context, email: _emailController.text, password: _passwordController.text, confirmPassword: _confirmPasswordController.text);               
            },splashColor: Colors.pink,text: "Sign-in",),            
          ],),
        ),
      ),
    );
  }
}

// //******************************************************************************************************************************************
// // FUNCTION/WIDGET -> MOVE TO SERVICE
// //******************************************************************************************************************************************
// //==========================================================================
// // FUNCTION: SIGN UP
// //==========================================================================   
// firebaseCreateUserWithEmailAndPassword(BuildContext context,{String email, String password, String confirmPassword}) {
// //==========================================================================
// // DECLARE VARIABLE
// //==========================================================================    
//     FirebaseAuth _auth = FirebaseAuth.instance;
// //==========================================================================
// // VAIDATION
// //==========================================================================     
//     if (password == confirmPassword && password.length >= 6) {
// //==========================================================================
// // SIGNUP SUCCESS
// //==========================================================================       
//         _auth.createUserWithEmailAndPassword(email: email, password: password).then((authenResult) {
//         logger.i("Sign up user successful.");
//         logger.i(authenResult.toString());
//         showMessageBox(context, "Success", 'Register Completed. Select the link in the email to activate your account.', actions: [dismissButton(context)]);        
// //==========================================================================
// // SIGNUP ERROR
// //==========================================================================         
//       }).catchError((error) {
//          logger.e(error.message);
//         showMessageBox(context, "Error", error.message, actions: [dismissButton(context)]);
//       });
// //==========================================================================
// // VALIDATE ERROR
// //==========================================================================       
//     } else {
//       logger.e("Password and Confirm-password do not match");
//     }
//   }
