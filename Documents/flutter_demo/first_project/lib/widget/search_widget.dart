import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {  
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,

  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _SearchWidget();
  }
}

class _SearchWidget extends State<SearchWidget>{
  final controller = TextEditingController();
  Color c = const Color(0xFF42A5F5);
  
  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint: styleActive;
    
    return Container(
      height: 42,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: Color.fromARGB(1000, 187, 222, 251),
        //border: Border.all()
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: style.color),
          suffixIcon: widget.text.isNotEmpty
            ?GestureDetector(
              child: Icon(Icons.close, color: style.color),
              onTap: (){
                controller.clear();
                widget.onChanged('');
                FocusScope.of(context).requestFocus(FocusNode());
              },
            ): null,
            hintText: widget.hintText,
            hintStyle: style,
            border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
