import 'package:bellbird/logic/components/components.dart';
import 'package:bellbird/ui/widgets/component_container.dart';
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

  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.note.title;
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
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
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 67.0,
              child: ReorderableListView.builder(
                header: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        color: Colors.black12,
                        height: 2.0,
                        width: MediaQuery.of(context).size.width - 16.0,
                      ),
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
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Author",
                            style: TextStyle(
                              fontFamily: "SF Pro",
                              fontSize: 20.0,
                              color: Colors.black38,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            widget.note.author,
                            style: const TextStyle(
                              fontFamily: "SF Pro",
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Last Modified",
                            style: TextStyle(
                              fontFamily: "SF Pro",
                              fontSize: 20.0,
                              color: Colors.black38,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            DateFormat('dd MMMM yyyy, hh:mm').format(
                              widget.note.dateCreated,
                            ),
                            style: const TextStyle(
                              fontFamily: "SF Pro",
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Tags",
                            style: TextStyle(
                              fontFamily: "SF Pro",
                              fontSize: 20.0,
                              color: Colors.black38,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          SizedBox(
                            height: 25.0,
                            width: MediaQuery.of(context).size.width - 81.0,
                            child: ListView.builder(
                              itemBuilder: (context, index) => TagWidget(
                                tag: widget.note.tags[index],
                              ),
                              itemCount: widget.note.tags.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        color: Colors.black12,
                        height: 2.0,
                        width: MediaQuery.of(context).size.width - 16.0,
                      ),
                    ],
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
                      newIndex = newIndex - 1;
                    }
                    final element = widget.note.elements.removeAt(oldIndex);
                    // final elementKey = keys.removeAt(oldIndex);
                    widget.note.elements.insert(newIndex, element);
                    // keys.insert(newIndex, elementKey);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
