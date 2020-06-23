//==========================================================================
// IMPORT
//==========================================================================
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:seedeal02/models/DealModel.dart';
import 'package:seedeal02/services/LoggerService.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/TextFieldWidget.dart';
import '../models/AppConfigModel.dart';
import '../services/DealService.dart' as DealService;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

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
  File _image;
  String _uploadedFileURL = ''; 
  final picker = ImagePicker();  


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
          actions: <Widget>[
            IconButton(icon: Icon(Icons.picture_in_picture),color: Colors.white,onPressed: (){getImageFromGallery();},),             
            IconButton(icon: Icon(Icons.local_see),color: Colors.white,onPressed: (){getImageFromCamera();},), 
            ],
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
            TextFieldWidget(text: '*Title', icon: Icons.featured_play_list, controller: titleController,),
            TextFieldWidget(text: '*Description', icon: Icons.format_align_left, controller: descriptionController,),    
            TextFieldWidget(text: '*Price', icon: Icons.attach_money, controller: priceController,),             
            SizedBox(height: 8),       
//==========================================================================
// TEXT: PERSONAL DETAIL
//==========================================================================                 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Owner Details',style: AppConfigModel().textStyleMBold),
            ),                     
            TextFieldWidget(text: '*Name', icon: Icons.person,controller: nameController,),
            TextFieldWidget(text: '*Surname', icon: Icons.recent_actors,controller: surnameController,),   
            SizedBox(height: 24),              

//==========================================================================
// BUTTON
//==========================================================================      
            ButtonBarWidget(onPressed: () async {      
//==========================================================================================
// UPLOAD FILE
//========================================================================================== 
                  if (_image != null){await fnUploadFile();}              
//==========================================================================
// CALL SERVICE: SET DATA TO FIREBASE
//==========================================================================               
                  DealService.setDeal(
                    context,
                    DealModel(
                      name: titleController.text,
                      description: descriptionController.text,
                      price: double.parse(priceController.text),                      
                      createdBy: nameController.text,                      
                      imageUrl: _uploadedFileURL,
                      docType: 'HOTEL',
                    )
                  );
            },splashColor: Colors.pink,text: "Save",),  
//================================================================================
// BUILD WIDGET IMAGE AND TEXT (1) UPLOAD 2) GOOGLE 3) WRONG URL
//================================================================================
            SizedBox(height: 16,),
            _image != null ? 
              Image.asset(_image.path,height: 200,):
              Container(
                alignment: Alignment.center,
                child: Text('Please select image from a top button',style: TextStyle(fontSize: 16),)),
          ],),
        ),
      ),
    );
  }

//==========================================================================
// GET IMAGE FROM CAMERA
//==========================================================================    
  Future getImageFromCamera() async {
      final pickedFile = await picker.getImage(source: ImageSource.camera);
      setState(() {
        _image = File(pickedFile.path);
      });
    }
//==========================================================================  
// GET IMAGE FROM GALLERY
//==========================================================================    
  Future getImageFromGallery() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        _image = File(pickedFile.path);
      });
    }
    
//==========================================================================================
// UPLOAD IMAGE TO GOOGLE STORAGE
//==========================================================================================
  Future fnUploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance.ref().child('chats/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    logger.i('File Uploaded');
    await storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      
      });
    });
  }



}
