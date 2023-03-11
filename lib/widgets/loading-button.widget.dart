import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  var busy = false;
  var invert = false;
  Function() func;
  var text = "";

  LoadingButton(
      {super.key,
      required this.busy,
      required this.func,
      required this.invert,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child:
                const CircularProgressIndicator(backgroundColor: Colors.white),
          )
        : Container(
            margin: const EdgeInsets.all(60),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: invert
                  ? Theme.of(context).primaryColor
                  : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60),
            ),
            child: TextButton(
              onPressed: func,
              child: Text(
                text,
                style: TextStyle(
                    color: invert
                        ? Colors.white.withOpacity(0.8)
                        : Theme.of(context).primaryColor,
                    fontSize: 30,
                    fontFamily: "Big Shoulders Display"),
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}
