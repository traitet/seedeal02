//==========================================================================
// IMPORT
//==========================================================================
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seedeal02/models/DealModel.dart';


//==========================================================================
// HOTEL VERT WIDGET
//==========================================================================
class LVHotelVertWidget extends StatelessWidget {
//==========================================================================
// CONSTRUCTURE
//==========================================================================
  final VoidCallback onTap;
  final String title;
//==========================================================================
// GET/SET
//==========================================================================
  LVHotelVertWidget({
    this.onTap,
    this.title = '',
    Key key,
  })  : assert(title != null),
        super(key: key);

//==========================================================================
// BUILD WIDGET
//==========================================================================
  @override
  Widget build(BuildContext context) {
//==========================================================================
// STREAM BUILDER
//==========================================================================    
    return StreamBuilder(
//==========================================================================
// CALL DB: FIREBASE
//==========================================================================      
      stream: Firestore.instance.collection("TT_POSTITEM").snapshots(),
      builder: (context, snapshot) {
//==========================================================================
// IF NO DATA, SHOW LOADING
//==========================================================================          
        if(!snapshot.hasData){
          return Center(
            child: Column( children: <Widget>[
              CircularProgressIndicator(),
              Text("Loading . . . "),              
            ],)

          );
        }
        else {
//==========================================================================
// **** NEED TO CALL SERVICE ****
//==========================================================================            
        List<DealModel> dealList = List<DealModel>.from(snapshot.data.documents.map((e) => DealModel.fromFilestore(e)));
        // Future<List<DealModel>> dealList = getDealList();
//==========================================================================
// RETURN WIDGET (ITEM)
//==========================================================================        
        return InkWell(
          onTap: onTap,
          child: Container(
            height: 400,
            padding: EdgeInsets.all(4),          
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.documents.length ,     
              itemBuilder: (context, index)  
              {
//==========================================================================
// RETURN BUILD CARD
//==========================================================================  
                  return buildCard(dealList, index);
              }, 
            ),
          ),
        );
      }//ELSE
      } //BUILDER
    );
  }

//==========================================================================
// BUILD CARD METHOD
//==========================================================================  
  Card buildCard(List<DealModel> dealList, int index) {
    return Card(
//==========================================================================
// ROW
//==========================================================================        
                child: Row(               
                  children: <Widget>[
//==========================================================================
// IMAGE
//==========================================================================                      
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.network(dealList[index].imageUrl)),
                  SizedBox(width: 8,),
//==========================================================================
// TEXT: DETAILS
//==========================================================================                    
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                          Row(children: <Widget>[
//==========================================================================
// RATING
//==========================================================================                              
                            Text('Very Good', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),), 
                            Icon(Icons.star,size: 18,color: Colors.orange,),Icon(Icons.star,size: 18,color: Colors.orange,),Icon(Icons.star,size: 18,color: Colors.orange,),],
                          ),               
//==========================================================================
// NAME
//==========================================================================                                             
                          Text(dealList[index].name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),    
//==========================================================================
// DESCRIPTION
//==========================================================================                                                         
                          Text(dealList[index].description,maxLines: 2, style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),),
//==========================================================================
// LOCATION
//==========================================================================                              
                          Row(children: <Widget>[
                            Icon(Icons.location_on,size: 18),
                            Text(dealList[index].name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
                          ],),       
//==========================================================================
// PRICE
//==========================================================================                                                 
                          Text(dealList[index].price.toStringAsFixed(0)+' บาท',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink),),                       
                    ],),
                  )
                ],) 
                
            
              );
  }
}
