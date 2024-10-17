import 'package:flutter/material.dart';
import 'package:talimger/view/widgets/app_color.dart';

class TalimgerTextField extends StatefulWidget {
  const TalimgerTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.isPassword,
    this.onChanged,
    this.controller,
  });

  final String? hintText;
  final String? labelText;
  final bool? isPassword;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  State<TalimgerTextField> createState() => _TalimgerTextFieldState();
}

class _TalimgerTextFieldState extends State<TalimgerTextField> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  _togglePassword() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;

      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText ?? 'Label',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          obscureText: widget.isPassword == false ? false : _obscured,
          onChanged: widget.onChanged,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText ?? 'Empty',
            hintStyle: TextStyle(
              color: Color(0xFFCCCCCC),
            ),
            suffixIcon: widget.isPassword == true
                ? GestureDetector(
                    onTap: _togglePassword,
                    child: !_obscured
                        ? Icon(
                            Icons.visibility_rounded,
                            color: Color(0xFFCCCCCC),
                          )
                        : Icon(
                            Icons.visibility_off_rounded,
                            color: Color(0xFFCCCCCC),
                          ),
                  )
                : SizedBox(),
            contentPadding: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFEBEEFA),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.primaryColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFEBEEFA),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
