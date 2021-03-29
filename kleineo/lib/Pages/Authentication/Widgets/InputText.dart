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
        style: Theme.of(context).textTheme.headline4,
        onChanged: widget.onChanged,
        validator: widget.validate,
        decoration: InputDecoration(
            border: Theme.of(context).inputDecorationTheme.border,
            hintStyle: Theme.of(context).textTheme.headline4,
            labelText: widget.labelText,
            labelStyle: Theme.of(context).textTheme.headline4,
            helperText: widget.helperText,
            helperStyle: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}
