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
class ProfilePage extends StatefulWidget {
 
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

//==========================================================================
// STATE
//==========================================================================
class _ProfilePageState extends State<ProfilePage> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();  
  TextEditingController _nameController = TextEditingController();    
  TextEditingController _surnameController = TextEditingController();    
  // TextEditingController _sexController = TextEditingController();    
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
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Profile'),
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
            TextFieldWidget(controller: _confirmPasswordController,text: '*Confirm Password', icon: Icons.vpn_key, textInputType: TextInputType.visiblePassword,obscureText: true,),    
            SizedBox(height: 8),       
//==========================================================================
// TEXT: PERSONAL DETAIL
//==========================================================================                 
            Padding(padding: const EdgeInsets.all(8.0),child: Text('Personal Details',style: AppConfigModel().textStyleMBold),),                     
            TextFieldWidget(controller: _nameController,text: '*Name', icon: Icons.account_box),
            TextFieldWidget(controller: _surnameController,text: '*Surname', icon: Icons.account_circle),   
//==========================================================================
// RADIO: SEX
//==========================================================================             
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: RadioHoriGroupWidget(itemList: [InputSelectionModel(index: 1,name: "Male",),InputSelectionModel(index: 2,name: "Female",),]),
            // ),                 
            // SizedBox(height: 8),
//==========================================================================
// BUTTON
//==========================================================================      
            ButtonBarWidget(onPressed: () {
              // firebaseCreateUserWithEmailAndPassword(context, email: _emailController.text, password: _passwordController.text, confirmPassword: _confirmPasswordController.text);
              print(_nameController.text);
              print('TEST');                  
            },splashColor: Colors.pink,text: "Save",),            
          ],),
        ),
      ),
    );
  }




}

