import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:todo_app/models/note_model.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/views/notes_view/widgets/color_listview.dart';
import 'package:todo_app/views/notes_view/widgets/custom_snackbar.dart';
import 'package:todo_app/views/notes_view/widgets/custom_text_field.dart';
import 'package:todo_app/views/notes_view/widgets/notes_view_app_bar.dart';

class EditView extends StatefulWidget {
  const EditView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  String? noteTitle;
  String? noteDes;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            NotesViewAppBar(
                title: "Edit Note",
                icon: Icons.check,
                onTap: () {
                  widget.note.title = noteTitle ?? widget.note.title;
                  widget.note.subTitle = noteDes ?? widget.note.subTitle;
                  // widget.note.color = colors[currentIndex].value ?? widget.note.color;

                  widget.note.save();
                  final snackBar = customSnackBar(
                      contentType: ContentType.warning,
                      description: "update Note Successful");

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                  Navigator.of(context).pop();
                }),
            const SizedBox(height: 32),
            CustomTextField(
              hintText: widget.note.title,
              onChanged: (val) => noteTitle = val,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: widget.note.subTitle,
              onChanged: (val) => noteDes = val,
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 39 * 2,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        currentIndex = index;
                        widget.note.color = colors[index].value;
                        setState(() {});
                      },
                      child: ColorItem(
                        isActive: currentIndex == index,
                        color: colors[index],
                      )),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemCount: colors.length),
            ),
          ],
        ),
      ),
    );
  }
}
