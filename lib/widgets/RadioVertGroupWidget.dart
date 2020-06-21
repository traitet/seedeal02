//==========================================================================
// IMPORT MATERIAL
//==========================================================================
import 'package:flutter/material.dart';
import '../models/AppConfigModel.dart';
import '../models/InputSelectionModel.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class RadioVertGroupWidget extends StatefulWidget {
 //==========================================================================
// CONSTRUCTURE
//==========================================================================
  final List<InputSelectionModel> itemList ;
//==========================================================================
// GET/SET
//==========================================================================
  RadioVertGroupWidget({
    this.itemList,
    Key key,
  })  : assert(itemList != null),
        super(key: key);   
  @override
  _RadioVertGroupWidgetState createState() => _RadioVertGroupWidgetState();
}

//==========================================================================
// STATE WIDGET
//==========================================================================
class _RadioVertGroupWidgetState extends State<RadioVertGroupWidget> {
//==========================================================================
// DEFAULT VARIABLE
//==========================================================================
  int value = 1;
  // List<ItemList> itemList = [ItemList(index: 1,name: "Male",),ItemList(index: 2,name: "Female",),];
//==========================================================================
// BUILD WIDGET
//==========================================================================
  build(BuildContext context) {
    return Column(
      children:
//==========================================================================
// LOOP TO SHOW IN COLUMN
//==========================================================================
          widget.itemList.map((data) => 
            RadioListTile(
              groupValue: value,
              value: data.index,
              title: Text("${data.name}",style: AppConfigModel().textStyleM,),
              onChanged: (val) {setState(() {value = data.index;});},
            )
                ).toList(),
    );
  }
}

//==========================================================================
// MODEL: ITEM LIST
//==========================================================================
class ItemList {
  String name;
  int index;
  ItemList({this.name, this.index});
}
