import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
    Key? key,
    required this.hintText,
    required this.border,
    this.suffixICon,
    this.onSuffixIconClick,
    this.isPassword = false,
    this.obscureText = false,
    required this.controller,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String hintText;
  final InputBorder border;
  final IconData? suffixICon;
  final VoidCallback? onSuffixIconClick;
  final bool isPassword;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: widget.border,
        contentPadding: const EdgeInsets.all(10),
        labelText: widget.hintText,
        suffixIcon: widget.isPassword
            ? IconButton(
                splashRadius: 20.0,
                onPressed: () {
                  widget.onSuffixIconClick!();
                },
                icon: Icon(widget.suffixICon),
              )
            : Icon(widget.suffixICon),
      ),
    );
  }
}
