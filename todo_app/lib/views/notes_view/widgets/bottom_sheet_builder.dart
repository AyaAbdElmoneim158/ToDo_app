import 'package:flutter/material.dart';
import 'package:todo_app/views/notes_view/widgets/custom_btn.dart';
import 'package:todo_app/views/notes_view/widgets/custom_text_field.dart';

class BottomSheetBuilder extends StatelessWidget {
  const BottomSheetBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          // key: _,
          child: SizedBox(
        height: 400,
        child: ListView(
          children: [
            const SizedBox(height: 16),
            const CustomTextField(hintText: "Note Title"),
            const SizedBox(height: 16),
            const CustomTextField(hintText: "Note Description", maxLines: 7),
            const SizedBox(height: 32),
            CustomBtn(onPressed: () {})
          ],
        ),
      )),
    );
  }
}
