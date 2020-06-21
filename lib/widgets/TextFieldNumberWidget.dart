//==========================================================================
// IMPORT MATERIAL
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class TextFieldNumberWidget extends StatelessWidget {
//==========================================================================
// CONSTRUCTURE
//==========================================================================
  final String text;
  final IconData icon;
  final TextEditingController controller;

//==========================================================================
// GET/SET
//==========================================================================
  TextFieldNumberWidget({
    this.text = 'Card No',
    this.icon,
    this.controller,
    Key key,
  })  : assert(text != null),
        super(key: key);

//==========================================================================
// OVERRIDE: BUILD
//==========================================================================
  @override
  Widget build(BuildContext context) {
   const double textFieldPadding = 4;     
    return Padding(
      padding: const EdgeInsets.all(textFieldPadding),
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5),
              ),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: text,
            prefixIcon: Icon(icon ?? Icons.email),
            fillColor: Colors.white70),
        controller: controller,
      ),
    );
  }
}
