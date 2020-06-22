//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:seedeal02/models/DealModel.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/TextFieldWidget.dart';
import '../models/AppConfigModel.dart';
import '../services/DealService.dart' as DealService;

//==========================================================================
// CLASS
//==========================================================================
class DealPostPage extends StatefulWidget {
 
  @override
  _DealPostPageState createState() => _DealPostPageState();
}

//==========================================================================
// STATE
//==========================================================================
class _DealPostPageState extends State<DealPostPage> {



  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController()..text = 'Bangkok';
    final descriptionController = TextEditingController()..text = '3 nights with homestay including breakfast and dinner'; 
    final priceController = TextEditingController()..text = '100';     
    final nameController = TextEditingController()..text = 'Traitet'; 
    final surnameController = TextEditingController()..text = 'https://firebasestorage.googleapis.com/v0/b/hellotest06-88fae.appspot.com/o/hotel05.JPG?alt=media&token=355b944f-5b70-4c83-baa8-e2293fe438fb';       

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
          actions: <Widget>[IconButton(icon: Icon(Icons.camera),color: Colors.white,onPressed: (){},), ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Post Deal Page'),
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
              child: Text('Last Minute Deal',style: AppConfigModel().textStyleMBold),
            ),
            TextFieldWidget(text: '*Title', icon: Icons.title, controller: titleController,),
            TextFieldWidget(text: '*Description', icon: Icons.description, controller: descriptionController,),    
            TextFieldWidget(text: '*Price', icon: Icons.access_alarms, controller: priceController,),             
            SizedBox(height: 8),       
//==========================================================================
// TEXT: PERSONAL DETAIL
//==========================================================================                 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Owner Details',style: AppConfigModel().textStyleMBold),
            ),                     
            TextFieldWidget(text: '*Name', icon: Icons.account_box,controller: nameController,),
            TextFieldWidget(text: '*Surname', icon: Icons.account_circle,controller: surnameController,),   
            SizedBox(height: 24),              

//==========================================================================
// BUTTON
//==========================================================================      
            ButtonBarWidget(onPressed: () {      
//==========================================================================
// CALL SERVICE: SET DATA TO FIREBASE
//==========================================================================               
                  DealService.setDeal(
                    DealModel(
                      name: titleController.text,
                      description: descriptionController.text,
                      price: double.parse(priceController.text),                      
                      createdBy: nameController.text,                      
                      imageUrl: surnameController.text,
                      docType: 'HOTEL',
                    )
                  );
            },splashColor: Colors.pink,text: "Save",),            
          ],),
        ),
      ),
    );
  }
}
