import 'package:flutter/material.dart';
import 'package:todo_app/views/notes_view/widgets/note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const NoteItem(),
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemCount: 28);
  }
}
