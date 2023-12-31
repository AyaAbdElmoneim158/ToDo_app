import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:todo_app/models/note_model.dart';
import 'package:todo_app/util/style.dart';
import 'package:todo_app/views/edit_view/edit_view.dart';
import 'package:todo_app/views/notes_view/widgets/custom_snackbar.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    //ToDo:.......... He use ListTitle
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditView(
              note: note,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    note.title,
                    style: AppTextStyle.styleNoteTitle(context),
                  ),
                  IconButton(
                      onPressed: () {
                        note.delete();
                        final snackBar = customSnackBar(
                            contentType: ContentType.failure,
                            description: "Deleted Note Successful");

                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                        BlocProvider.of<NotesCubit>(context).fetchNotes();
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ))
                ],
              ),
              const SizedBox(height: 8),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  note.subTitle,
                  style: AppTextStyle.styleNoteDes(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 16),
            ]),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                note.date,
                style: AppTextStyle.styleNoteDate(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
