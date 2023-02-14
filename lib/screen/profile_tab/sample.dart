import 'package:flutter/material.dart';

class EditableTextFormField extends StatefulWidget {
  @override
  _EditableTextFormFieldState createState() => _EditableTextFormFieldState();
}

class _EditableTextFormFieldState extends State<EditableTextFormField> {
  bool isEditable = false;
  TextEditingController? _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      decoration: InputDecoration(
        hintText: 'Enter text',
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isEditable = !isEditable;
            });
          },
          icon: Icon(Icons.edit),
        ),
      ),
      enabled: isEditable,
      readOnly: !isEditable,
    );
  }
}
