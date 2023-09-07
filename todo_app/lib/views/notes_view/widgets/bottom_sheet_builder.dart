import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:todo_app/cubits/add_notes/add_notes_cubit.dart';
import 'package:todo_app/cubits/add_notes/add_notes_state.dart';
import 'package:todo_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:todo_app/views/notes_view/widgets/custom_snackbar.dart';
import 'package:todo_app/views/notes_view/widgets/form_bottom_sheet.dart';

class BottomSheetBuilder extends StatelessWidget {
  const BottomSheetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddNotesCubit(),
        child: BlocConsumer<AddNotesCubit, AddNotesState>(
          listener: (context, state) {
            if (state is AddNotesSuccess) {
              debugPrint("AddNotesSuccess");
              Navigator.pop(context); //! message
              final snackBar = customSnackBar(
                  contentType: ContentType.success,
                  title: "Add Note Successful");

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
              BlocProvider.of<NotesCubit>(context).fetchNotes();
            }
            if (state is AddNotesFailure) {
              debugPrint("AddNotesFailure");
              Navigator.pop(context); //! message
              final snackBar = customSnackBar(
                  contentType: ContentType.failure, title: "Add Note failure");

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddNotesLoading ? true : false,
                child: const FormBottomSheet());
          },
        ));
  }
}
