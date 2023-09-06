import 'package:flutter/material.dart';
import 'package:todo_app/util/constants.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    this.onPressed,
    super.key,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            backgroundColor: kPrimaryColor),
        child: const Text(
          "Add Task",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
