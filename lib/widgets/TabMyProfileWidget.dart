//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import '../screens/PaymentMethodPage.dart';
import '../screens/TravelBuddiesPage.dart';
import '../screens/PersonalDetailPage.dart';
import '../singletons/GlobalAppData.dart';
import '../services/FirebaseAuthenService.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class TabMyProfileWidget extends StatelessWidget {
//==========================================================================
// CONSTUCTURE
//==========================================================================  
  const TabMyProfileWidget({
    Key key,
  }) : super(key: key);
//==========================================================================
// BUILD WIDGET
//==========================================================================
  @override
    Widget build(BuildContext context) {
      String imageUrl = globalAppData.imageProfileUrl; 
      String displayName = globalAppData.name;
    return 
//==========================================================================
// BODY
//==========================================================================
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
//==========================================================================
// IMAGE
//==========================================================================
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image:  imageUrl == '' ?  AssetImage('assets/images/nueng.png'): NetworkImage(imageUrl),
                          )),
                    ),
                    SizedBox(width: 15),
//==========================================================================
// COLUMN: TEXTS
//==========================================================================
                    Flexible(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Hi there!'),
                            Text(displayName == '' ? 'Traitet Thepbandansuk': displayName,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(fontSize: 18,color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),


//==========================================================================
// LIST TILE & TEXT: MY PERFERENCE
//==========================================================================
    Text('My Preferences',style: TextStyle(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold)),
    SizedBox(height: 5),    
    ListTile(trailing: Icon(Icons.credit_card),title: Text('Payment Method'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethodPage()),);},),  
    ListTile(trailing: Icon(Icons.people),title: Text('Travel Buddy'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => TravelBuddiesPage()),);},),
    SizedBox(height: 15),   
//==========================================================================
// LIST TILE & TEXT: ACCOUNT SETTING
//==========================================================================              
    Text('Account Settings',style: TextStyle(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold)),     
    SizedBox(height: 5),        
    ListTile(trailing: Icon(Icons.chrome_reader_mode),title: Text('Personal Details & Password'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalDetailPage()),);},),   
//==========================================================================
// LOTOUT
//==========================================================================    
    ListTile(trailing: Icon(Icons.exit_to_app),title: Text('Logout'),onTap: (){signOut(context);}),
     //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);},),        
    


              ],

//==========================================================================
// LISTTILE
//==========================================================================


            ),
          ),
        );
  }
}
