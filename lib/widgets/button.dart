import 'package:flutter/material.dart';

class ButtonBasic extends StatefulWidget {
  const ButtonBasic(
      {Key? key,
      required this.text,
      required this.pressed,
      this.height,
      this.width,
      required this.color})
      : super(key: key);
  final String text;
  final Function() pressed;
  final double? width;
  final double? height;
  final Color color;

  @override
  State<ButtonBasic> createState() => _ButtonBasicState();
}

class _ButtonBasicState extends State<ButtonBasic> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
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
          fillColor: widget.color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      height: widget.height,
      width: widget.width,
    );
  }
}
