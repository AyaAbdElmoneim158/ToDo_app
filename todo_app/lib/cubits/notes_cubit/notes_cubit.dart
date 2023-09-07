import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/cubits/notes_cubit/notes_state.dart';
import 'package:todo_app/models/note_model.dart';
import 'package:todo_app/util/constants.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel> notes = [];
  void fetchNotes() {
    debugPrint(
        "len ${Hive.box<NoteModel>(notesBoxName).values.length.toString()}");
    var box = Hive.box<NoteModel>(notesBoxName);
    notes = box.values.toList();
    emit(NotesFetching());
  }
}
