import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  const InputText({
    Key key,
    this.onChanged,
    this.validate,
    this.labelText,
    this.helperText,
  }) : super(key: key);
  final Function onChanged;
  final Function validate;
  final String labelText, helperText;

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        onChanged: widget.onChanged,
        validator: widget.validate,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.white)),
            hintStyle: TextStyle(color: Colors.white),
            labelText: widget.labelText,
            helperText: widget.helperText),
      ),
    );
  }
}
