import 'package:flutter/material.dart';

class ButtonIcon extends StatefulWidget {
  
   const ButtonIcon({Key? key, required this.pressed,this.padding, this.height,required this.icon, this.width,this.borderRadius,required this.color})
      : super(key: key);
  final Function() pressed;
  final double? width;
  final double? height; 
  final BorderRadius? borderRadius; 
  final EdgeInsets? padding;
  final Icon icon;
  final Color color;

  @override
  State<ButtonIcon> createState() => _ButtonIconState();
}

class _ButtonIconState extends State<ButtonIcon> {
  @override
  Widget build(BuildContext context) {
    return 
    
    SizedBox(child:
    Padding(
        child: RawMaterialButton(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                widget.icon
              ],
            ),
          ),
          onPressed: widget.pressed ,
          fillColor: widget.color,
          shape: RoundedRectangleBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(50)),
        ),
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 20),
      ),height: widget.height, width: widget.width,)
    ;
  }
}
