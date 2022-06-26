import 'package:bellbird/logic/components/base_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import '../../logic/components/components.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ComponentContainer extends StatefulWidget {
  ComponentContainer({
    Key? key,
    required this.component,
    required this.style,
    this.block = false,
    this.bullet = Bullet.none,
    this.focus = false,
    this.indent = 10.0,
  }) : super(key: key);

  BaseComponent component;
  Map style;
  Bullet bullet;
  bool focus;
  bool block;
  double indent;

  @override
  State<ComponentContainer> createState() => _ComponentContainerState();
}

class _ComponentContainerState extends State<ComponentContainer> {
  final TextEditingController _contentController = TextEditingController();

  // DropDownMenu Options
  var options = [
    "heading1",
    "heading2",
    "heading3",
    "title",
    "subtitle",
    "body",
    "caption",
  ];

  var options2 = [
    "system",
    "monospace",
    "sans-serif",
    "round",
    "handwriting",
  ];

  // DropDownMenu Default
  String dropdownvalue = "body";
  String dropdownvalue2 = "system";
  bool isFocused = false;

  @override
  void initState() {
    if (widget.component.runtimeType == TextComponent) {
      _contentController.text = getContent(widget.component);
    }
    if (widget.style["first"]) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => showComponentModal(),
      );
    }
    return super.initState();
  }

  String fontSelector() {
    switch (widget.style["fontFamily"]) {
      case TextFontFamily.system:
        return "SF Pro";
      case TextFontFamily.monospace:
        return "Monospace";
      case TextFontFamily.sansSerif:
        return "Sans Serif";
      case TextFontFamily.handwriting:
        return "Handwriting";
      case TextFontFamily.round:
        return "Rounded";
      default:
        return "SF Pro";
    }
  }

  FontWeight fontWeightSelector() {
    switch (widget.style["fontWeight"]) {
      case TextFontWeight.bold:
        return FontWeight.bold;
      case TextFontWeight.normal:
        return FontWeight.normal;
      case TextFontWeight.regular:
        return FontWeight.w400;
      default:
        return FontWeight.normal;
    }
  }

  TextAlign alignmentSelector() {
    switch (widget.style["alignment"]) {
      case TextAlignment.justify:
        return TextAlign.justify;
      case TextAlignment.left:
        return TextAlign.start;
      case TextAlignment.right:
        return TextAlign.end;
      case TextAlignment.center:
        return TextAlign.center;
      default:
        return TextAlign.start;
    }
  }

  double computeWidth(BuildContext context) {
    double maxWidth =
        MediaQuery.of(context).size.width - widget.style["indent"] - 28.0;

    if (widget.style["bullet"] == Bullet.bullet ||
        widget.style["bullet"] == Bullet.checkBox) {
      maxWidth -= 35.0;
    }

    if (widget.style["quote"]) {
      maxWidth -= 35.0;
    }

    if (widget.style["block"]) {
      maxWidth -= 2;
    }

    return maxWidth;
  }

  Widget renderComponentContent(component) {
    switch (component.runtimeType) {
      case TextComponent:
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: computeWidth(context),
          ),
          child: Text(
            component.content == "" || component.content == " "
                ? "..."
                : component.content,
            textAlign: component.content == "" || component.content == " "
                ? TextAlign.center
                : alignmentSelector(),
            style: TextStyle(
              color: widget.style["fontColor"],
              fontFamily:
                  widget.style["quotes"] == true ? "quote" : fontSelector(),
              fontSize: widget.style["fontFamily"] == TextFontFamily.handwriting
                  ? widget.style["fontSize"] + 8
                  : widget.style["fontSize"],
              fontWeight: fontWeightSelector(),
            ),
          ),
        );
      // case TodoComponent:

      //   break;
      // case BulletComponent:

      //   break;
      // case NumberedComponent:

      //   break;
      default:
        return Container();
    }
  }

  String getContent(component) {
    return component.content;
  }

  void setContent(component, content) {
    setState(() {
      component.content = content;
    });
  }

  bool setFocus() {
    if (widget.style["first"]) {
      widget.style["first"] = false;
      return true;
    }
    return false;
  }

  Future<dynamic> showComponentModal() {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: const Color(0xfffefffe),
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: ((context, setModalState) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom == 0
                        ? MediaQuery.of(context).size.height * (0.5)
                        : MediaQuery.of(context).size.height * (0.65),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8.0,
                        ),
                        displayWidget(
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: computeWidth(context) - 52,
                            ),
                            child: TextField(
                              textAlign: alignmentSelector(),
                              autofocus: setFocus(),
                              maxLines: 5,
                              controller: _contentController,
                              autocorrect: true,
                              cursorHeight: 35.0,
                              cursorColor: widget.style["fontColor"],
                              style: TextStyle(
                                color: widget.style["fontColor"],
                                fontFamily: widget.style["quotes"] == true
                                    ? "quote"
                                    : fontSelector(),
                                fontSize: widget.style["fontFamily"] ==
                                        TextFontFamily.handwriting
                                    ? widget.style["fontSize"] + 10
                                    : widget.style["fontSize"],
                                fontWeight: fontWeightSelector(),
                              ),
                              decoration: InputDecoration.collapsed(
                                hintText: "What's on your mind...",
                                hintStyle: TextStyle(
                                  color: widget.style["fontColor"]
                                      .withOpacity(0.45),
                                  fontFamily: widget.style["quotes"] == true
                                      ? "quote"
                                      : fontSelector(),
                                  fontSize: widget.style["fontFamily"] ==
                                          TextFontFamily.handwriting
                                      ? widget.style["fontSize"] + 10
                                      : widget.style["fontSize"],
                                  fontWeight: fontWeightSelector(),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  setContent(widget.component, value);
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              width: 150.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: const Color(0xfff1f2ef),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Center(
                                child: DropdownButtonFormField(
                                  dropdownColor: const Color(0xfff1f2ef),
                                  decoration: const InputDecoration.collapsed(
                                    hintText: "",
                                  ),
                                  value: dropdownvalue,
                                  icon: const Icon(
                                      FlutterRemix.arrow_drop_down_fill),
                                  items: options.map((String option) {
                                    return DropdownMenuItem(
                                      value: option,
                                      child: Text(
                                        option,
                                        style: const TextStyle(
                                          fontFamily: "SF Pro",
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setModalState(() {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                        switch (newValue) {
                                          case "heading1":
                                            widget.style["type"] =
                                                TextType.heading1;
                                            break;
                                          case "heading2":
                                            widget.style["type"] =
                                                TextType.heading2;
                                            break;
                                          case "heading3":
                                            widget.style["type"] =
                                                TextType.heading3;
                                            break;
                                          case "title":
                                            widget.style["type"] =
                                                TextType.title;
                                            break;
                                          case "subtitle":
                                            widget.style["type"] =
                                                TextType.subtitle;
                                            break;
                                          case "body":
                                            widget.style["type"] =
                                                TextType.body;
                                            break;
                                          case "caption":
                                            widget.style["type"] =
                                                TextType.caption;
                                            break;
                                          default:
                                            widget.style["type"] =
                                                TextType.body;
                                        }
                                      });
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: const Color(0xfff1f2ef),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Pick a color!'),
                                        content: SingleChildScrollView(
                                          child: MaterialPicker(
                                            pickerColor:
                                                widget.style["backgroundColor"],
                                            onColorChanged: (color) {
                                              setModalState(() {
                                                Navigator.of(context).pop();
                                                WidgetsBinding.instance
                                                    .focusManager.primaryFocus
                                                    ?.unfocus();
                                                setState(() {
                                                  widget.style[
                                                          "backgroundColor"] =
                                                      color;
                                                });
                                              });
                                            }, // only on portrait mode
                                          ),
                                        ),
                                        // actions: <Widget>[
                                        //   GestureDetector(
                                        //     onTap: () {
                                        //       Navigator.of(context).pop();
                                        //     },
                                        //     child: Container(
                                        //       width: 80.0,
                                        //       height: 40.0,
                                        //       decoration: BoxDecoration(
                                        //         color: const Color(0xfff1f2ef),
                                        //         borderRadius:
                                        //             BorderRadius.circular(6.0),
                                        //       ),
                                        //       child: Center(
                                        //         child: Text(
                                        //           'Got it',
                                        //           style: TextStyle(
                                        //             fontFamily: fontSelector(),
                                        //             fontSize: 18.0,
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   )
                                        // ],
                                      );
                                    },
                                    context: context,
                                  );
                                },
                                child: Center(
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: widget.style["backgroundColor"],
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: const Color(0xfff1f2ef),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Pick a color!'),
                                        content: SingleChildScrollView(
                                          child: MaterialPicker(
                                            pickerColor:
                                                widget.style["fontColor"],
                                            onColorChanged: (color) {
                                              setModalState(() {
                                                Navigator.of(context).pop();
                                                WidgetsBinding.instance
                                                    .focusManager.primaryFocus
                                                    ?.unfocus();
                                                setState(() {
                                                  widget.style["fontColor"] =
                                                      color;
                                                });
                                              });
                                            }, // only on portrait mode
                                          ),
                                        ),
                                        // actions: <Widget>[
                                        //   GestureDetector(
                                        //     onTap: () {
                                        //       Navigator.of(context).pop();
                                        //     },
                                        //     child: Container(
                                        //       width: 80.0,
                                        //       height: 40.0,
                                        //       decoration: BoxDecoration(
                                        //         color: const Color(0xfff1f2ef),
                                        //         borderRadius:
                                        //             BorderRadius.circular(6.0),
                                        //       ),
                                        //       child: Center(
                                        //         child: Text(
                                        //           'Got it',
                                        //           style: TextStyle(
                                        //             fontFamily: fontSelector(),
                                        //             fontSize: 18.0,
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   )
                                        // ],
                                      );
                                    },
                                    context: context,
                                  );
                                },
                                child: Center(
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: widget.style["fontColor"],
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xfff1f2ef),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setModalState(() {
                                              setState(() {
                                                widget.style["block"] =
                                                    !widget.style["block"];
                                              });
                                            });
                                          },
                                          child: Container(
                                            height: 40.0,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  widget.style["block"] == true
                                                      ? const Color(0xffbebfbc)
                                                      : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: const Icon(
                                              FlutterRemix.focus_2_line,
                                              color: Color(0xff72706b),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setModalState(() {
                                              setState(() {
                                                widget.style["quote"] =
                                                    !widget.style["quote"];
                                              });
                                            });
                                          },
                                          child: Container(
                                            height: 40.0,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  widget.style["quote"] == true
                                                      ? const Color(0xffbebfbc)
                                                      : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: const Icon(
                                              FlutterRemix.double_quotes_r,
                                              color: Color(0xff72706b),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                    ]),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xfff1f2ef),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setModalState(() {
                                              setState(() {
                                                widget.style["alignment"] =
                                                    TextAlignment.left;
                                              });
                                            });
                                          },
                                          child: Container(
                                            height: 40.0,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  widget.style["alignment"] ==
                                                          TextAlignment.left
                                                      ? const Color(0xffbebfbc)
                                                      : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: const Icon(
                                              FlutterRemix.align_left,
                                              color: Color(0xff72706b),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setModalState(() {
                                              setState(() {
                                                widget.style["alignment"] =
                                                    TextAlignment.center;
                                              });
                                            });
                                          },
                                          child: Container(
                                            height: 40.0,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  widget.style["alignment"] ==
                                                          TextAlignment.center
                                                      ? const Color(0xffbebfbc)
                                                      : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: const Icon(
                                              FlutterRemix.align_center,
                                              color: Color(0xff72706b),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setModalState(() {
                                              setState(() {
                                                widget.style["alignment"] =
                                                    TextAlignment.justify;
                                              });
                                            });
                                          },
                                          child: Container(
                                            height: 40.0,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  widget.style["alignment"] ==
                                                          TextAlignment.justify
                                                      ? const Color(0xffbebfbc)
                                                      : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: const Icon(
                                              FlutterRemix.align_justify,
                                              color: Color(0xff72706b),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setModalState(() {
                                              setState(() {
                                                widget.style["alignment"] =
                                                    TextAlignment.right;
                                              });
                                            });
                                          },
                                          child: Container(
                                            height: 40.0,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  widget.style["alignment"] ==
                                                          TextAlignment.right
                                                      ? const Color(0xffbebfbc)
                                                      : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: const Icon(
                                              FlutterRemix.align_right,
                                              color: Color(0xff72706b),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                    ]),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: const Color(0xfff1f2ef),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  if (widget.style["indent"] < 64.0) {
                                    setModalState(() {
                                      setState(() {
                                        widget.style["indent"] += 8.0;
                                      });
                                    });
                                  } else {
                                    setModalState(() {
                                      setState(() {
                                        widget.style["indent"] = 8.0;
                                      });
                                    });
                                  }
                                },
                                child: Center(
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffbebfbc),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: const Icon(
                                      FlutterRemix.indent_increase,
                                      color: Color(0xff72706b),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              width: 200.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: const Color(0xfff1f2ef),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Center(
                                child: DropdownButtonFormField(
                                  dropdownColor: const Color(0xfff1f2ef),
                                  decoration: const InputDecoration.collapsed(
                                    hintText: "",
                                  ),
                                  value: dropdownvalue2,
                                  icon: const Icon(
                                      FlutterRemix.arrow_drop_down_fill),
                                  items: options2.map((String option2) {
                                    return DropdownMenuItem(
                                      value: option2,
                                      child: Text(
                                        option2,
                                        style: TextStyle(
                                          fontFamily: option2,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setModalState(() {
                                      setState(() {
                                        dropdownvalue2 = newValue!;
                                        switch (newValue) {
                                          case "system":
                                            widget.style["fontFamily"] =
                                                TextFontFamily.system;
                                            break;
                                          case "sans-serif":
                                            widget.style["fontFamily"] =
                                                TextFontFamily.sansSerif;
                                            break;
                                          case "round":
                                            widget.style["fontFamily"] =
                                                TextFontFamily.round;
                                            break;
                                          case "monospace":
                                            widget.style["fontFamily"] =
                                                TextFontFamily.monospace;
                                            break;
                                          case "handwriting":
                                            widget.style["fontFamily"] =
                                                TextFontFamily.handwriting;
                                            break;
                                          default:
                                            widget.style["fontFamily"] =
                                                TextFontFamily.system;
                                        }
                                      });
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xfff1f2ef),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setModalState(() {
                                              setState(() {
                                                if (widget.style["bullet"] ==
                                                    Bullet.checkBox) {
                                                  widget.style["bullet"] =
                                                      Bullet.none;
                                                } else {
                                                  widget.style["bullet"] =
                                                      Bullet.checkBox;
                                                }
                                              });
                                            });
                                          },
                                          child: Container(
                                            height: 40.0,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: widget.style["bullet"] ==
                                                      Bullet.checkBox
                                                  ? const Color(0xffbebfbc)
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: const Icon(
                                              FlutterRemix.list_check_2,
                                              color: Color(0xff72706b),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setModalState(() {
                                              setState(() {
                                                if (widget.style["bullet"] ==
                                                    Bullet.bullet) {
                                                  widget.style["bullet"] =
                                                      Bullet.none;
                                                } else {
                                                  widget.style["bullet"] =
                                                      Bullet.bullet;
                                                }
                                              });
                                            });
                                          },
                                          child: Container(
                                            height: 40.0,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: widget.style["bullet"] ==
                                                      Bullet.bullet
                                                  ? const Color(0xffbebfbc)
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: const Icon(
                                              FlutterRemix.list_unordered,
                                              color: Color(0xff72706b),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onDoubleTap: () {
          showComponentModal();
        },
        child: displayWidget(
          renderComponentContent(widget.component),
        ),
      ),
    );
  }

  Widget displayWidget(child) {
    return Container(
      margin: EdgeInsets.only(
        top: 1.0,
        left: widget.style["indent"],
        bottom: 1.0,
        right: 8.0,
      ),
      decoration: BoxDecoration(
        color: widget.style["backgroundColor"],
        border: widget.style["block"] == false
            ? null
            : Border.all(
                width: 1.0,
                color: widget.style["fontColor"],
              ),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10.0,
          ),
          if (widget.style["bullet"] == Bullet.checkBox)
            SizedBox(
              width: 20.0,
              child: Center(
                child: Checkbox(
                  side: BorderSide(
                    color: widget.style["fontColor"],
                  ),
                  checkColor: Colors.white,
                  onChanged: (bool? value) {},
                  value: false,
                ),
              ),
            ),
          if (widget.style["bullet"] == Bullet.bullet)
            SizedBox(
              width: 20.0,
              child: Center(
                child: Text(
                  "●",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: widget.style["fontColor"],
                  ),
                ),
              ),
            ),
          if (widget.style["bullet"] == Bullet.bullet ||
              widget.style["bullet"] == Bullet.checkBox)
            const SizedBox(
              width: 10.0,
            ),
          Padding(
            padding: widget.style["bullet"] == Bullet.bullet
                ? const EdgeInsets.symmetric(vertical: 4.0)
                : const EdgeInsets.symmetric(vertical: 4.0),
            child: child,
          ),
          if (widget.style["quote"] == true)
            const SizedBox(
              width: 10.0,
            ),
          if (widget.style["quote"] == true)
            Padding(
              padding: widget.style["bullet"] == Bullet.bullet
                  ? const EdgeInsets.symmetric(vertical: 4.0)
                  : const EdgeInsets.symmetric(vertical: 4.0),
              child: SizedBox(
                child: Icon(
                  FlutterRemix.double_quotes_r,
                  color: widget.style["fontColor"],
                ),
              ),
            ),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
  }
}
