import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class H2 extends StatelessWidget {
  final String text;
  const H2({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: Color.fromARGB(255, 255, 255, 255)),
        ));
  }
}

class H3 extends StatelessWidget {
  final String text;
  const H3({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFFB3B3B3)),
        ));
  }
}

class H4 extends StatelessWidget {
  final String text;
  H4({Key? key, required this.text, this.center, this.padding})
      : super(key: key);

  double? padding;
  bool? center;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding != null
            ? EdgeInsets.only(left: padding!)
            : EdgeInsets.symmetric(vertical: 10),
        child: Text(text,
            textAlign: center == true ? TextAlign.center : TextAlign.left,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 30)));
  }
}

class TextAdd extends StatelessWidget {
  final String text;
  TextAdd({Key? key, required this.text, this.padding}) : super(key: key);

  double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding != null
            ? EdgeInsets.only(left: padding!)
            : EdgeInsets.only(left: 20),
        child: Text(text,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Color(0xffFFA857))));
  }
}

class Description extends StatelessWidget {
  final String text;
  TextAlign? align;
  Description({Key? key, required this.text, this.align = TextAlign.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
    );
  }
}

class CustomPagePadding extends StatelessWidget {
  final Widget child;
  const CustomPagePadding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 10),
          child: child),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color background;
  final Function() onPress;
  final Color? border;

  const CustomButton(
      {Key? key,
      required this.text,
      required this.background,
      required this.onPress,
      this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: background,
      onPressed: onPress,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            text,
          )),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
              color: border != null ? border! : background, width: 2)),
    );
  }
}

class AppBarText extends StatelessWidget {
  final String text;
  AppBarText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.montserrat(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 30));
  }
}

class TextInput extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const TextInput({Key? key, required this.hint, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFFB3B3B3)),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFFB3B3B3), width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFFB3B3B3), width: 2.0),
          ),
          hintText: hint,
          hintStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFFB3B3B3))),
    );
  }
}

class TextArea extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  TextArea({Key? key, required this.hint, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      minLines: 10,
      maxLines: 20,
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFFB3B3B3)),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFFB3B3B3), width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFFB3B3B3), width: 2.0),
          ),
          hintText: hint,
          hintStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFFB3B3B3))),
    );
  }
}

class Footer extends StatelessWidget {
  final List<Widget> children;
  const Footer({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 40, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}

class StepManager {
  final List<Widget> children;
  StepManager({required this.children});

  int step = 0;

  void next({VoidCallback? callback}) {
    if ((children.length - 1) > step) {
      step++;
    } else {
      if (callback != null) {
        callback();
      }
    }
  }

  void previous() {
    if (step > 0) {
      step--;
    }
  }

  int getStep() {
    return step;
  }

  Widget getActual() {
    return children[step];
  }

  Widget getInt(int newStep) {
    return children[newStep];
  }
}

void errorDialog(BuildContext context, String title, String text) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Description(text: text),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Ok'),
            )
          ],
        );
      });
}
