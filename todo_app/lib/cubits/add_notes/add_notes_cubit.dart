import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/models/note_model.dart';
import 'package:todo_app/util/constants.dart';
import 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  void addNote(NoteModel noteModel) {
    emit(AddNotesLoading());
    Hive.box<NoteModel>(notesBoxName).add(noteModel).then((value) {
      debugPrint("AddNotesSuccess..... $value");
      emit(AddNotesSuccess());
    }).catchError((err) {
      debugPrint("AddNotesFailure....");
      emit(AddNotesFailure(err: err.toString()));
    });
  }
}
