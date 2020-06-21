//==========================================================================
// IMPORT
//==========================================================================
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'LoggerService.dart';
import '../services/ShowNotiService.dart';

//==========================================================================
// FUNCTION
//==========================================================================
Future<void> registerProduct(BuildContext context, Map<String, dynamic> data, String documentName){
//==========================================================================
// RETURN
//==========================================================================     
    return
//==========================================================================
// SAVE DATA TO FIREBASE
//==========================================================================     
    Firestore.instance.collection("product").document(documentName).setData(data).then((returnData) {
//==========================================================================
// SHOW MESSAGEBOX (SUCCESS)
//==========================================================================      
    showMessageBox(context, "success", "Register Product($documentName) to Firestore Database completely", actions: [dismissButton(context)]);
    logger.i("setData Success");
//==========================================================================
// CATCH ERROR
//==========================================================================       
      }).catchError((e){
        logger.e("setDAta Error");
        logger.e(e);
      });
    }
