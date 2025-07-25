import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final colors = Theme.of(context).colorScheme;

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(10),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Puto',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          print('Button: $textValue');
          textController.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value: $value');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
