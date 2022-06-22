import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:intl/intl.dart';
import '../../logic/components/components.dart';
import '../../logic/note.dart';
import '../widgets/tag_widget.dart';

class NotesHomeWidget extends StatelessWidget {
  const NotesHomeWidget(
      {Key? key, required this.note, required BuildContext context})
      : super(key: key);

  final Note note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/NotesPage", arguments: note);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300.0,
                child: Text(
                  note.title,
                  style: const TextStyle(
                    fontFamily: "SF Pro",
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              if (note.reminder != null)
                const Icon(
                  FlutterRemix.notification_3_fill,
                  color: Color(0xff0081c2),
                  size: 17.0,
                ),
              const SizedBox(
                width: 4.0,
              ),
              if (note.tags.contains("#Favorites"))
                const Icon(
                  FlutterRemix.star_fill,
                  color: Colors.amber,
                  size: 17.0,
                ),
            ],
          ),
          const SizedBox(
            height: 7.0,
          ),
          if (renderer(
                note.elements[0],
              ) !=
              false)
            renderer(
              note.elements[0],
            ),
          if (renderer(
                note.elements[0],
              ) !=
              false)
            const SizedBox(
              height: 7.0,
            ),
          Row(
            children: [
              Text(
                DateFormat('yyyy/MM/dd').format(note.dateCreated),
                style: const TextStyle(
                  fontFamily: "SF Pro",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black38,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                width: 5.0,
              ),
              TagWidget(
                tag: note.tags[0],
              ),
              // TagWidget(
              //   tag: note.tags[1],
              // ),
              if (note.tags.length > 1)
                Text(
                  "+${note.tags.length - 1}",
                  style: const TextStyle(
                    fontFamily: "SF Pro",
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 7.0,
          ),
          // Container(
          //   height: 2.0,
          //   color: const Color(0xffbebebe),
          // )
          if (note.reminder != null)
            Text(
              "Reminder: ${DateFormat('MMM dd, HH:mm').format(note.dateCreated)}",
              style: const TextStyle(
                fontFamily: "SF Pro",
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Color(0xff0081c2),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          const Divider(
            thickness: 1.5,
            height: 20.0,
          )
        ],
      ),
    );
  }
}

dynamic renderer(component) {
  switch (component.runtimeType) {
    case TextComponent:
      return component.content != ""
          ? Text(
              component.content,
              style: const TextStyle(
                fontFamily: "SF Pro",
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          : false;
    case FileComponent:
      return component.url != ""
          ? const Icon(
              FlutterRemix.file_3_fill,
              color: Color(0xff0081c2),
              size: 17.0,
            )
          : false;
    case TableComponent:
      return component.data != ""
          ? const Icon(
              FlutterRemix.table_alt_line,
              color: Color(0xffc39ac9),
              size: 17.0,
            )
          : false;
    default:
      return const Text("Can not decode component content");
  }
}
