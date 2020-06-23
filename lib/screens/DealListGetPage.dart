
//==========================================================================
// REMAIN
//==========================================================================
// 1) GET DATA FROM FIREBASE ( LINK DATA FROM SERVICE)

//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import '../widgets/LVHotelVertWidget.dart';
import '../screens/DealGetPage.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class DealListGetPage extends StatefulWidget {
  @override
  _DealListGetPageState createState() => _DealListGetPageState();
}
//==========================================================================
// STATE CLASS
//==========================================================================
class _DealListGetPageState extends State<DealListGetPage> {
//==========================================================================
// BUILD WIDGET
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
//==========================================================================
// SCAFFOLD / TITLE + BACK
//========================================================================== 
        appBar: buildAppBar(context),
//==========================================================================
// BODY
//==========================================================================
            body: SafeArea(
              child: Column(
                children: <Widget>[
//==========================================================================
// HEADER BAR# HEADER
//==========================================================================
                Container(
                  color: Colors.black87,
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  //decoration: BoxDecoration(color: Colors.black87),    
                  alignment: Alignment.center,
                  child: Text('Manchester to London', style: TextStyle(color: Colors.white,fontSize: 18),),
                ) ,
//==========================================================================
// HEADER BAR# LINE2
//==========================================================================              
                Container(
                    color: Colors.black87,
                    //decoration: BoxDecoration(color: Colors.black87), 
                    padding: EdgeInsets.only(bottom: 8),                               
                    child: Row(children: <Widget>[
                    SizedBox(width: 8,),
                    Text('30 May - 31 May', style: TextStyle(color: Colors.white, fontSize: 12),),
                    Text(' | ', style: TextStyle(color: Colors.white),),
                    Icon(Icons.person,color: Colors.white, size:18),
                    Text(' 2', style: TextStyle(color: Colors.white, fontSize: 12),),
                    Text(' | ', style: TextStyle(color: Colors.white, fontSize: 12),),
                    Icon(Icons.hotel,color: Colors.white, size:18),
                    Expanded(child: Text(' 2', style: TextStyle(color: Colors.white, fontSize: 12),)),     
                    Text('Modify', style: TextStyle(color: Colors.white, fontSize: 12),),  
                    Icon(Icons.edit,color: Colors.white, size:18),  
                  ],),
                ) , 
//==========================================================================
// CALL WIDGET
//==========================================================================         
                Expanded(child: LVHotelVertWidget(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DealGetPage()),);},),),
//==========================================================================
// END LISTVIEW
//========================================================================== 
              ],),)));
  } // END  CLASS


//==========================================================================
// BUILD APPBAR FUNCTION
//==========================================================================
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
//==========================================================================
// ICON BUTTON
//==========================================================================          
        actions: <Widget>[
          IconButton(icon: Icon(Icons.filter_list),color: Colors.white,onPressed: (){},),          
          ],
//==========================================================================
// BACK BUTTON
//==========================================================================             
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
//==========================================================================
// TITLE
//==========================================================================           
        title: Text('Search Hotel'),
//==========================================================================
// CENTER
//==========================================================================             
        centerTitle: false  ,
//==========================================================================
// SEARCH BAR
//==========================================================================   
        bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child:  Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 15.0),
          child: Center(
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: TextField(
                onSubmitted: (value){
                },
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.black38),
                    hintText: "Search ",
                    hintStyle: TextStyle(color: Colors.black38)),
              ),
            ),
          ),
        ),
      ),
    
        
      );
  }
}




