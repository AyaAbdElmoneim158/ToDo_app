import 'package:flutter/material.dart';
import 'package:todo_app/util/constants.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    this.onPressed,
    this.isLoading = false,
    super.key,
  });
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            backgroundColor: kPrimaryColor),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                    color: Colors.black, strokeWidth: 3),
              )
            : const Text(
                "Add Task",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
