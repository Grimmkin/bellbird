import 'package:bellbird/logic/components/base_component.dart';

import 'components/components.dart';

class Note {
  DateTime dateCreated;
  DateTime dateModified;
  DateTime? reminder;
  List? activity;
  List? connected;
  String? author;
  String title;
  List tags;
  List<BaseComponent> elements;
  bool favorite = false;

  Note({
    this.reminder,
    DateTime? dateCreated,
    DateTime? dateModified,
    required this.activity,
    required this.connected,
    required this.author,
    required this.title,
    required this.tags,
    required this.elements,
  })  : dateCreated = DateTime.now(),
        dateModified = DateTime.now();
}
