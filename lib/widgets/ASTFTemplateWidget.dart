//==========================================================================
// IMPORT MATERIAL
//==========================================================================
import 'package:flutter/material.dart';
import '../models/AppConfigModel.dart';
import '../models/InputSelectionModel.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class ASTFTemplateWidget extends StatefulWidget {
//==========================================================================
// CONSTRUCTURE
//==========================================================================
  final List<InputSelectionModel> itemList;
//==========================================================================
// GET/SET
//==========================================================================
  ASTFTemplateWidget({
    this.itemList,
    Key key,
  })  : assert(itemList != null),
        super(key: key);  
//==========================================================================
// OVERRIDE
//==========================================================================        
  @override
  _ASTFTemplateWidgetState createState() => _ASTFTemplateWidgetState();
}

//==========================================================================
// STATE WIDGET
//==========================================================================
class _ASTFTemplateWidgetState extends State<ASTFTemplateWidget> {
//==========================================================================
// DEFAULT VARIABLE
//==========================================================================
  int value = 1;
//==========================================================================
// BUILD WIDGET
//==========================================================================
  build(BuildContext context) {
    return Row(
      children:
//==========================================================================
// LOOP TO SHOW IN COLUMN
//==========================================================================
        widget.itemList.map((data) => Row(children: <Widget>[
//==========================================================================
// RADIO BUTTON
//==========================================================================                      
            Radio(
              groupValue: value,
              value: data.index,
              onChanged: (val) {setState(() {value = data.index;});},
              ),
//==========================================================================
// TEXT
//==========================================================================                      
            Text("${data.name}",style: AppConfigModel().textStyleM,),                      
          ],
         )
        ).toList(),
    );
  } // BUILD
} // STATE CLASS

