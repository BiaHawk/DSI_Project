import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'infra.dart';


class ForgotPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ForgotPassword();
  }
}

class ForgotPassword extends State<ForgotPasswordPage>{
  @override
  Widget build(BuildContext context) {
    return DsiScaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Spacer(),
            Image(
              image: Images.bsiLogo,
              height: 100,
            ),
            Constants.spaceSmallHeight,
            Padding(
              padding: Constants.paddingMedium,
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Digite seu e-mail*'),
                validator: (String value) {
                  return value.isEmpty ? 'e-mail inválido.' : null;
                },
              ),
            ),
            Constants.spaceMediumHeight,
            SizedBox(
              width: 390,
              height: 35,
              child: RaisedButton(
                color: Colors.green,
                child: Text('Enviar'),
                onPressed: (){
                  dsiDialog.showInfo(
                    context: context,
                    message: 'instruções de recuperação foram enviadas para o e-mail',
                  );
                },
              ),
            ),
            FlatButton(
              child: Text('Cancelar'),
              padding: Constants.paddingSmall,
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
