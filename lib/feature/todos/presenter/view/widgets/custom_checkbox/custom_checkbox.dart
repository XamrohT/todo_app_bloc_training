import 'package:flutter/material.dart';
import 'package:todo_app_bloc/shared/styles/styles.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
 State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: isChecked ? Colors.blue.withValues(alpha:0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(6), // Rounded square
          border: Border.all(
            color: AppColors.boxTextColors,
            width: 2,
          ),
        ),
        child: isChecked
            ? const Icon(Icons.check, color: Colors.blue, size: 20)
            : null,
      ),
    );
  }
}