// ignore_for_file: public_member_api_docs, sort_constructors_first
// part of 'add_notes_cubit.dart';

// @immutable
abstract class AddNotesState {}

class AddNotesInitial extends AddNotesState {}

class AddNotesLoading extends AddNotesState {}

class AddNotesSuccess extends AddNotesState {}

class AddNotesFailure extends AddNotesState {
  final String err;
  AddNotesFailure({
    required this.err,
  });
}
