import 'package:flutter/material.dart';
import 'package:todo_app/util/style.dart';
import 'package:todo_app/views/notes_view/widgets/custom_icon.dart';

class NotesViewAppBar extends StatelessWidget {
  const NotesViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Notes", style: AppTextStyle.styleTitle(context)),
        const CustomIcon()
      ],
    );
  }
}
