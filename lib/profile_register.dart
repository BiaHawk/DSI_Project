


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dsi_app/constants.dart';
import 'package:my_dsi_app/infra.dart';

class ProfileRegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileRegister();
  }
}

class ProfileRegister extends State<ProfileRegisterPage>{
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
                decoration: const InputDecoration(labelText: 'Digite seu nome'),
                validator: (String value) {
                  return value.isEmpty ? 'Este campo deve ser preenchido.' : null;
                },

              ),
            ),
            Padding(
              padding: Constants.paddingMedium,
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Digite seu telefone'),
                validator: (String value) {
                  return value.isEmpty ? 'Este campo deve ser preenchido.' : null;
                },
              ),
            ),
            Padding(
              padding: Constants.paddingMedium,
              child: TextFormField(
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(labelText: 'Digite seu aniversário'),
                validator: (String value) {
                  return value.isEmpty ? 'Este campo deve ser preenchido.' : null;
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
                    message: 'Perfil criado com sucesso!',
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

