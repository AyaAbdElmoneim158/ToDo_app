import 'package:flutter/material.dart';
import 'package:todo_app/util/style.dart';
import 'package:todo_app/views/notes_view/widgets/custom_icon.dart';

class NotesViewAppBar extends StatelessWidget {
  const NotesViewAppBar(
      {super.key, this.title = "Notes", this.icon = Icons.search, this.onTap});
  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyle.styleTitle(context)),
        GestureDetector(
            onTap: onTap,
            child: CustomIcon(
              icon: icon,
            ))
      ],
    );
  }
}
