import 'package:flutter/material.dart';
import 'package:todo_app/views/notes_view/widgets/notes_view_app_bar.dart';
import 'package:todo_app/views/notes_view/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 24),
            NotesViewAppBar(),
            NotesViewBody(),
          ],
        ),
      ),
    );
  }
}
