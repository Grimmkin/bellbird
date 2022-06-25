import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../../logic/note.dart';
import '../../logic/components/components.dart';
import '../widgets/notes_home_widget.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _value = '';

  FocusNode textSecondFocusNode = FocusNode();

  List<Note> notes = [
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: [
        "#Luis",
        "#Travel",
        "#Favorites",
        "#Luis",
        "#Travel",
        "#Favorites",
        "#Luis",
        "#Travel",
        "#Favorites",
      ],
      elements: [
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        ),
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm. Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm. Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        ),
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        ),
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        ),
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm. Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm. Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        ),
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        ),
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        ),
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm. Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm. Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        ),
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        ),
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      //reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "File Component",
      tags: ["#Favorites"],
      elements: [
        FileComponent(
            url:
                "C:/Users/thann/Documents/Projects/bellbird/inspo/shot 1 reverse.mp4")
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: [
        "#Luis",
        "#Travel",
      ],
      elements: [
        TableComponent(
          data:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [
        FileComponent(
            url:
                "C:/Users/thann/Documents/Projects/bellbird/inspo/shot 1 reverse.mp4")
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      //reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: ["#Luis", "#Travel", "#Favorites"],
      elements: [
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [
        FileComponent(
            url:
                "C:/Users/thann/Documents/Projects/bellbird/inspo/shot 1 reverse.mp4")
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: [
        "#Luis",
        "#Travel",
      ],
      elements: [
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      //reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [TextComponent()],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: ["#Luis", "#Travel", "#Favorites"],
      elements: [
        TableComponent(
          data:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [
        FileComponent(
            url:
                "C:/Users/thann/Documents/Projects/bellbird/inspo/shot 1 reverse.mp4")
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      //reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: ["#Luis", "#Travel", "#Favorites"],
      elements: [
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [
        FileComponent(
            url:
                "C:/Users/thann/Documents/Projects/bellbird/inspo/shot 1 reverse.mp4")
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: ["#Luis", "#Travel", "#Favorites"],
      elements: [
        TableComponent(
          data:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [TextComponent()],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: ["#Luis", "#Travel", "#Favorites"],
      elements: [
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [
        FileComponent(
            url:
                "C:/Users/thann/Documents/Projects/bellbird/inspo/shot 1 reverse.mp4")
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: ["#Luis", "#Travel", "#Favorites"],
      elements: [
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [TextComponent()],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: ["#Luis", "#Travel", "#Favorites"],
      elements: [
        TableComponent(
          data:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [
        FileComponent(
            url:
                "C:/Users/thann/Documents/Projects/bellbird/inspo/shot 1 reverse.mp4")
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: ["#Luis", "#Travel", "#Favorites"],
      elements: [
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [TextComponent()],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: ["#Luis", "#Travel", "#Favorites"],
      elements: [
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [
        FileComponent(
            url:
                "C:/Users/thann/Documents/Projects/bellbird/inspo/shot 1 reverse.mp4")
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: ["#Luis", "#Travel", "#Favorites"],
      elements: [
        TableComponent(
          data:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [TextComponent()],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: ["#Luis", "#Travel", "#Favorites"],
      elements: [
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [
        FileComponent(
            url:
                "C:/Users/thann/Documents/Projects/bellbird/inspo/shot 1 reverse.mp4")
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: ["#Luis", "#Travel", "#Favorites"],
      elements: [
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [TextComponent()],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: ["#Luis", "#Travel", "#Favorites"],
      elements: [
        TextComponent(
          content:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [
        FileComponent(
            url:
                "C:/Users/thann/Documents/Projects/bellbird/inspo/shot 1 reverse.mp4")
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title: "Dog Sitters of Compton",
      tags: ["#Luis", "#Travel"],
      elements: [
        TableComponent(
          data:
              "Food: Feed twice per day. Space meals 12 hours apart. Have 34 labradors go into the kennels at 12:30pm",
        )
      ],
    ),
    Note(
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      reminder: DateTime.now(),
      activity: [],
      connected: [],
      author: "Daniel Ogunsola",
      title:
          "To-do List for Saturday for Aunty Feyi and Uncle Segun's Wedding Ceremony in Monarch Event Center",
      tags: ["#Favorites"],
      elements: [TextComponent()],
    ),
  ];

  Color pickerColor = const Color(0xff9cb7f9);
  Color currentColor = const Color(0xff9cb7f9);

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: RichText(
            text: TextSpan(
          text: "All Notes",
          style: const TextStyle(
            color: Colors.black,
            fontFamily: "SF Pro",
            fontWeight: FontWeight.w700,
            fontSize: 19.0,
          ),
          children: [
            TextSpan(
              text: "(${notes.length})",
              style: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            onLongPress: () {
              showDialog(
                context: context,
                builder: (BuildContext cxt) {
                  return Dialog(
                    child: Container(
                      color: Colors.amber,
                      height: 400.0,
                    ),
                  );
                },
              );
            },
            child: const Icon(
              FlutterRemix.menu_2_fill,
              color: Colors.black,
              //size: 30.0,
            ),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      //endDrawer: ,
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.75,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            Container(
              color: Colors.red,
              width: 100.0,
              height: 400.0,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NotesHomeWidget(
              note: notes[index],
              context: context,
            );
          },
        ),
      ),
    );
  }
}
