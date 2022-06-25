// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'base_component.dart';

class TextComponent extends BaseComponent {
  String content;

  TextComponent({this.content = '', Map<String, dynamic>? style})
      : super(
          style: style,
        );
}
