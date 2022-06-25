import 'package:bellbird/logic/components/components.dart';
import 'package:bellbird/ui/widgets/component_container.dart';
import 'package:bellbird/ui/widgets/display_widget.dart';
import 'package:bellbird/ui/widgets/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import '../../logic/components/base_component.dart';
import '../../logic/note.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({
    Key? key,
    this.note,
  }) : super(key: key);

  final dynamic note;

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  TextEditingController _titleController = TextEditingController();

  TextEditingController _footerController = TextEditingController();

  ScrollController _mainController = ScrollController();

  @override
  void initState() {
    _titleController.text = widget.note.title;
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 8.0,
              ),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: const [
                    Icon(
                      FlutterRemix.arrow_left_s_line,
                      color: Colors.black,
                      size: 27.0,
                    ),
                    Text(
                      "All Notes",
                      style: TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 67.0,
              child: ReorderableListView.builder(
                scrollController: _mainController,
                header: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _titleController,
                        onSubmitted: (String value) {
                          widget.note.title = value;
                        },
                        autocorrect: true,
                        cursorHeight: 35.0,
                        cursorColor: Colors.black,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "SF Pro",
                        ),
                        decoration: const InputDecoration.collapsed(
                          hintText: "Page Title",
                          hintStyle: TextStyle(
                            fontFamily: "SF Pro",
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                footer: GestureDetector(
                  onTap: () {
                    TextComponent component = TextComponent(
                      content: "",
                      style: {
                        "backgroundColor": Colors.transparent,
                        "fontColor": Colors.black,
                        "fontFamily": TextFontFamily.system,
                        "fontSize": 20.0,
                        "fontWeight": TextFontWeight.regular,
                        "alignment": TextAlignment.left,
                        "indent": 8.0,
                        "type": TextType.body,
                        "quote": false,
                        "block": false,
                        "strikethrough": false,
                        "bullet": Bullet.none,
                        "resized": false,
                        "first": true,
                      },
                    );
                    setState(() {
                      widget.note.elements.add(
                        component,
                      );
                    });
                  },
                  child: SizedBox(
                    height: 100.0,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                buildDefaultDragHandles: false,
                itemCount: widget.note.elements.length,
                itemBuilder: (context, index) {
                  return ReorderableDelayedDragStartListener(
                    key: ObjectKey(index),
                    index: index,
                    child: ComponentContainer(
                      component: widget.note.elements[index],
                      style: widget.note.elements[index].style,
                    ),
                  );
                },
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final TextComponent item =
                        widget.note.elements.removeAt(oldIndex);
                    widget.note.elements.insert(newIndex, item);
                  });
                  // setState(() {
                  //   if (newIndex > oldIndex) {
                  //     newIndex = newIndex - 1;
                  //   }
                  //   final element = widget.note.elements.removeAt(oldIndex);
                  //   widget.note.elements.insert(newIndex, element);
                  // });
                },
                onReorderStart: (index) {
                  print(widget.note.elements[index].content);
                },
                onReorderEnd: (index) {
                  print(widget.note.elements[index].content);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
