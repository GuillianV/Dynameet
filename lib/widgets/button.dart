import 'package:flutter/material.dart';

class ButtonBasic extends StatefulWidget {
  const ButtonBasic({Key? key, required this.text, required this.pressed})
      : super(key: key);
  final String text;
  final Function() pressed;

  @override
  State<ButtonBasic> createState() => _ButtonBasicState();
}

class _ButtonBasicState extends State<ButtonBasic> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        child: RawMaterialButton(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(widget.text,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: "EtnaSS",
                    ))
              ],
            ),
          ),
          onPressed: widget.pressed,
          fillColor: const Color(0xffFFA857),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
      )
    ;
  }
}
