import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/cubits/add_notes/add_notes_state.dart';
import 'package:todo_app/models/note_model.dart';
import 'package:todo_app/util/constants.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  Color colorNotes = const Color(0xff0E2954);

  void addNote(NoteModel noteModel) {
    noteModel.color = colorNotes.value;
    emit(AddNotesLoading());
    debugPrint(
        "len ${Hive.box<NoteModel>(notesBoxName).values.length.toString()}");
    Hive.box<NoteModel>(notesBoxName).add(noteModel).then((value) {
      debugPrint("AddNotesSuccess..... $value");
      emit(AddNotesSuccess());
    }).catchError((err) {
      debugPrint("AddNotesFailure....$err");
      emit(AddNotesFailure(err: err.toString()));
    });
  }
}
