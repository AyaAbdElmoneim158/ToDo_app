import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:todo_app/cubits/notes_cubit/notes_state.dart';
import 'package:todo_app/models/note_model.dart';
import 'package:todo_app/views/notes_view/widgets/note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
      List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes;

      return ListView.separated(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => NoteItem(note: notes[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: notes.length);
    });
  }
}
