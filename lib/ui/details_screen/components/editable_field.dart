import 'package:flutter/material.dart';

class EditableField extends StatelessWidget {
  const EditableField({Key? key, required this.text, required this.isEditable, required this.textAlign}) : super(key: key);
   final String? text;
   final bool? isEditable;
   final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.0,
      child: TextField(
        textAlign: textAlign,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Colors.black),
        ),
        enabled: isEditable,
      ),
    );
  }
}
