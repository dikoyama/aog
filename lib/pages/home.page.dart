import 'package:aog/widgets/sucess.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import '../widgets/logo.widget.dart';
import '../widgets/submit-form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.purple;
  var _gasCtrl = MoneyMaskedTextController();
  var _alcCtrl = MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: const Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            const Logo(),
            _completed
                ? Sucess(reset: reset, result: _resultText)
                : SubmitForm(
                    gasCtrl: _gasCtrl,
                    alcCtrl: _alcCtrl,
                    busy: _busy,
                    submitFunc: calculate)
          ],
        ),
      ),
    );
  }

  Future calculate() {
    double alc =
        double.parse(_alcCtrl.text.replaceAll(RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(_gasCtrl.text.replaceAll(RegExp(r'[,.]'), '')) / 100;
    double res = alc / gas;

    setState(() {
      _color = Colors.deepPurple;
      _completed = false;
      _busy = true;
    });

    return Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Compensa utilizar Gasolina";
        } else {
          _resultText = "Compensa utilizar Álcool";
        }

        _completed = true;
        _busy = false;
      });
    });
  }

  reset() {
    setState(() {
      _color = Theme.of(context).primaryColor;
      _alcCtrl = MoneyMaskedTextController();
      _gasCtrl = MoneyMaskedTextController();
      _completed = false;
      _busy = false;
    });
  }
}
