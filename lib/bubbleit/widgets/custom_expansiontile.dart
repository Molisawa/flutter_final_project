import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final String selectedValue;
  final List<String> options;
  final ValueChanged<String> onChanged;

  const CustomExpansionTile({
    Key? key,
    required this.selectedValue,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(selectedValue.isEmpty ? 'Seleccione una leche' : selectedValue),
      children: [
        for (String option in options)
          Column(
            children: [
              RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: selectedValue,
                onChanged: (String? value) {
                  onChanged(value!);
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
