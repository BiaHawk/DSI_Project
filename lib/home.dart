import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dsi_app/infra.dart';
import 'constants.dart';
import 'package:my_dsi_app/profile_register.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DsiScaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Home'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileRegisterPage(),),);

              },
            ),
          ),
          Icon(Icons.more_vert),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Opacity(
      opacity: 0.5,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfff7ffe8), Color(0xffc2ca94)], // Color(0xffc7ffba)
            stops: [0.8, 1.0],
            transform: GradientRotation(pi / 2.03),
          ),
          image: DecorationImage(
            image: Images.bsiLogo,
          ),
        ),
      ),
    );
  }
}
