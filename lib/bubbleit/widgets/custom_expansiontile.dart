import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final String titleText;
  final String selectedValue;
  final List<String> options;
  final ValueChanged<String> onChanged;

  const CustomExpansionTile({
    Key? key,
    required this.titleText,
    required this.selectedValue,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.titleText),
      backgroundColor: Colors.transparent,
      collapsedBackgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      childrenPadding: const EdgeInsets.all(20.0),
      children: [
        for (String option in widget.options)
          Column(
            children: [
              RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: widget.selectedValue,
                onChanged: (String? value) {
                  widget.onChanged(value!);
                },
              ),
              const Divider(
                height: 1,
                color: Colors.grey,
              ),
            ],
          ),
      ],
    );
  }
}
