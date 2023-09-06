import 'package:flutter/material.dart';
import 'package:todo_app/views/notes_view/widgets/custom_text_field.dart';
import 'package:todo_app/views/notes_view/widgets/notes_view_app_bar.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            NotesViewAppBar(
                title: "Edit Note",
                icon: Icons.check,
                onTap: () {
                  Navigator.of(context).pop();
                }),
            const SizedBox(height: 32),
            const CustomTextField(hintText: "Enter Task Title"),
            const SizedBox(height: 16),
            const CustomTextField(
              hintText: "Enter Task des",
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
