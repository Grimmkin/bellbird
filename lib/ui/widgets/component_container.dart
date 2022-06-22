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
  //bool toggleable = false;

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

  // DropDownMenu Default
  String dropdownvalue = "body";

  @override
  void initState() {
    if (widget.component.runtimeType == TextComponent) {
      _contentController.text = getContent(widget.component);
    }
    return super.initState();
  }

  String fontSelector() {
    switch (widget.style["fontFamily"]) {
      case TextFontFamily.system:
        return "SF Pro";
      case TextFontFamily.mono:
        return "SF Pro";
      case TextFontFamily.sansSerif:
        return "SF Pro";
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
      maxWidth -= 25.0;
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
            // maxWidth: MediaQuery.of(context).size.width -
            //     (widget.style["indent"] + 74.0),
          ),
          child: Text(
            component.content,
            textAlign: alignmentSelector(),
            style: TextStyle(
              color: widget.style["fontColor"],
              fontFamily:
                  widget.style["quotes"] == true ? "quote" : fontSelector(),
              fontSize: widget.style["fontSize"],
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onDoubleTap: () {
          showModalBottomSheet(
              backgroundColor: const Color(0xfffefffe),
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: widget.style["backgroundColor"],
                          border: Border.all(
                            color: widget.style["backgroundColor"],
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 16.0,
                          child: TextField(
                            maxLines: 5,
                            controller: _contentController,
                            autocorrect: true,
                            cursorHeight: 35.0,
                            cursorColor: widget.style["fontColor"],
                            style: TextStyle(
                              color: widget.style["fontColor"],
                              fontSize: 22.0,
                              fontWeight: fontWeightSelector(),
                              fontFamily: "SF Pro",
                            ),
                            decoration: const InputDecoration.collapsed(
                              hintText: "",
                            ),
                            onChanged: (value) {
                              setContent(widget.component, value);
                            },
                          ),
                        ),
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
                                      style: TextStyle(
                                        fontFamily: fontSelector(),
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
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
                                        widget.style["type"] = TextType.title;
                                        break;
                                      case "subtitle":
                                        widget.style["type"] =
                                            TextType.subtitle;
                                        break;
                                      case "body":
                                        widget.style["type"] = TextType.body;
                                        break;
                                      case "caption":
                                        widget.style["type"] = TextType.caption;
                                        break;
                                      default:
                                        widget.style["type"] = TextType.body;
                                    }
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
                                            setState(() {
                                              widget.style["backgroundColor"] =
                                                  color;
                                            });
                                          }, // only on portrait mode
                                        ),
                                      ),
                                      actions: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            width: 80.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xfff1f2ef),
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Got it',
                                                style: TextStyle(
                                                  fontFamily: fontSelector(),
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
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
                                            setState(() {
                                              widget.style["fontColor"] = color;
                                            });
                                          }, // only on portrait mode
                                        ),
                                      ),
                                      actions: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            width: 80.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xfff1f2ef),
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Got it',
                                                style: TextStyle(
                                                  fontFamily: fontSelector(),
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
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
                                          setState(() {
                                            widget.style["block"] =
                                                !widget.style["block"];
                                          });
                                        },
                                        child: Container(
                                          height: 40.0,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: widget.style["block"] == true
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
                                          setState(() {
                                            widget.style["quote"] =
                                                !widget.style["quote"];
                                          });
                                        },
                                        child: Container(
                                          height: 40.0,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: widget.style["quote"] == true
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
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        color: Colors.black12,
                        height: 2.0,
                        width: MediaQuery.of(context).size.width - 16.0,
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
                                      child: Container(
                                        height: 40.0,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xffbebfbc),
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        child: const Icon(
                                          FlutterRemix.align_left,
                                          color: Color(0xff72706b),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 40.0,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xffbebfbc),
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        child: const Icon(
                                          FlutterRemix.align_center,
                                          color: Color(0xff72706b),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 40.0,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xffbebfbc),
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        child: const Icon(
                                          FlutterRemix.align_justify,
                                          color: Color(0xff72706b),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 40.0,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xffbebfbc),
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        child: const Icon(
                                          FlutterRemix.align_right,
                                          color: Color(0xff72706b),
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
                              onTap: () {},
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
                      )
                    ],
                  ),
                );
              });
        },
        child: Container(
          margin: EdgeInsets.only(
            top: 4.0,
            left: widget.style["indent"],
            bottom: 4.0,
            right: 8.0,
          ),
          decoration: BoxDecoration(
            color: widget.style["backgroundColor"],
            border: widget.style["block"] == false
                ? null
                : Border.all(
                    width: 1.5,
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
                      checkColor: Colors.white,
                      onChanged: (bool? value) {},
                      value: false,
                    ),
                  ),
                ),
              if (widget.style["bullet"] == Bullet.bullet)
                const SizedBox(
                  width: 20.0,
                  child: Center(
                    child: Text(
                      "●",
                      style: TextStyle(
                        fontSize: 20.0,
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
                    : const EdgeInsets.symmetric(vertical: 12.0),
                child: renderComponentContent(widget.component),
              ),
              if (widget.style["quote"] == true)
                Padding(
                  padding: widget.style["bullet"] == Bullet.bullet
                      ? const EdgeInsets.symmetric(vertical: 4.0)
                      : const EdgeInsets.symmetric(vertical: 12.0),
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
        ),
      ),
    );
  }
}
