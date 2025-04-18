import 'package:flutter/material.dart';
import 'loading-button.widget.dart';

class Sucess extends StatelessWidget {
  var result = "";
  Function() reset;

  Sucess({super.key, required this.reset, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Text(
            result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontFamily: "Big Shoulders Display",
            ),
            textAlign: TextAlign.center,
          ),
          LoadingButton(
              busy: false,
              func: reset,
              invert: true,
              text: "CALCULAR NOVAMENTE"),
        ],
      ),
    );
  }
}
