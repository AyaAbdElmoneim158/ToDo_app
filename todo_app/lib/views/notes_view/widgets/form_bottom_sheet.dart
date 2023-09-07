import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/add_notes/add_notes_cubit.dart';
import 'package:todo_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:todo_app/cubits/notes_cubit/notes_state.dart';
import 'package:todo_app/models/note_model.dart';
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
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: SizedBox(
                height: 400,
                child: ListView(
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
                    CustomBtn(onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        NoteModel noteModel = NoteModel(
                            title: title!,
                            subTitle: description!,
                            date: DateTime.now().toString(),
                            color: const Color(0xff9BCDD2).value);
                        BlocProvider.of<AddNotesCubit>(context)
                            .addNote(noteModel);
                        BlocProvider.of<NotesCubit>(context).fetchNotes();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    })
                  ],
                ),
              )),
        );
      },
    );
  }
}
