import 'package:flutter/material.dart';

import 'package:talimger/view/widgets/screen_size.dart';

class TalimgerDropdown extends StatefulWidget {
  const TalimgerDropdown({
    super.key,
    this.hintText,
    this.labelText,
    this.items,
  });

  final String? hintText;
  final String? labelText;
  final List<DropdownMenuItem>? items;

  @override
  State<TalimgerDropdown> createState() => _TalimgerDropdownState();
}

class _TalimgerDropdownState extends State<TalimgerDropdown> {
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
        Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Color(0xFFEBEEFA),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          width: getScreenWidth(context),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              items: widget.items,
              borderRadius: BorderRadius.circular(20),
              hint: Text(
                widget.hintText ?? '',
                style: TextStyle(
                  color: Color(0xFFCCCCCC),
                ),
              ),
              onChanged: (value) {},
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
