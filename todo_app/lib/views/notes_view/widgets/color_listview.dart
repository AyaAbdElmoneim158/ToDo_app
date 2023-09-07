import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/add_notes/add_notes_cubit.dart';
import 'package:todo_app/util/constants.dart';

class ColorList extends StatefulWidget {
  const ColorList({
    super.key,
  });

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39 * 2,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNotesCubit>(context).colorNotes =
                    colors[index];
                setState(() {});
              },
              child: ColorItem(
                isActive: currentIndex == index ? true : false,
                color: colors[index],
              )),
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemCount: colors.length),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 39,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 39,
            backgroundColor: color,
          );
  }
}
