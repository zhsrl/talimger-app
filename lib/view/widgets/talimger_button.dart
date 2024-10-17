import 'package:flutter/material.dart';
import 'package:talimger/view/widgets/screen_size.dart';

class TalimgerButton extends StatefulWidget {
  TalimgerButton({
    super.key,
    this.color,
    this.onPressed,
    this.text,
    this.isLoading,
  });

  final Color? color;
  final VoidCallback? onPressed;
  final String? text;
  final bool? isLoading;

  @override
  State<TalimgerButton> createState() => _TalimgerButtonState();
}

class _TalimgerButtonState extends State<TalimgerButton> {
  @override
  Widget build(BuildContext context) {
    Color color = widget.color ?? Color(0xFF233981);
    bool isLoading = widget.isLoading ?? false;

    return SizedBox(
      width: getScreenWidth(context),
      height: 50,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: color,
          foregroundColor: Colors.white,
        ),
        child: isLoading
            ? CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              )
            : Text(
                widget.text ?? '',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
