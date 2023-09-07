import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0) //? ~> typeId To this object  (unique) [0...255]
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  @HiveField(2)
  late final String date;
  @HiveField(3)
  int color;

  NoteModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
  });
}
