import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/cubits/add_notes/add_notes_cubit.dart';
import 'package:todo_app/cubits/add_notes/add_notes_state.dart';
import 'package:todo_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:todo_app/models/note_model.dart';
import 'package:todo_app/views/notes_view/widgets/color_listview.dart';
import 'package:todo_app/views/notes_view/widgets/custom_btn.dart';
import 'package:todo_app/views/notes_view/widgets/custom_text_field.dart';

class FormBottomSheet extends StatefulWidget {
  const FormBottomSheet({super.key});

  @override
  State<FormBottomSheet> createState() => _FormBottomSheetState();
}

class _FormBottomSheetState extends State<FormBottomSheet> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 8, right: 8, bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                const SizedBox(height: 16),
                CustomTextField(
                    hintText: "Note Title", onSaved: (val) => title = val),
                const SizedBox(height: 16),
                CustomTextField(
                    hintText: "Note Description",
                    maxLines: 7,
                    onSaved: (val) => description = val),
                const SizedBox(height: 32),
                const ColorList(),
                const SizedBox(height: 32),
                BlocBuilder<AddNotesCubit, AddNotesState>(
                    builder: (context, state) {
                  return CustomBtn(
                      isLoading: state is AddNotesLoading ? true : false,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          NoteModel noteModel = NoteModel(
                              title: title!,
                              subTitle: description!,
                              date: DateFormat.yMd().format(DateTime.now()),
                              color: BlocProvider.of<AddNotesCubit>(context)
                                  .colorNotes
                                  .value);
                          BlocProvider.of<AddNotesCubit>(context)
                              .addNote(noteModel);
                          BlocProvider.of<NotesCubit>(context).fetchNotes();
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      });
                }),
              ],
            )),
      ),
    );
  }
}
